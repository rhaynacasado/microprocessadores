#include <stdbool.h>

bool mode = 0;  // tempo do timer: mode = 0 (1s) mode = 1 (0,25s)
bool contando = 0; 
signed char ucContador = -1;  // variavel global para incremento

void ConfigMCU(){
    ADCON1 |= 0x0F;  // configura pinos como digitais 

    // configura botoes
    TRISB.RB0 = 1;  // configura pino RB0 como entrada no PORTB
    PORTB.RB0 = 1;  // valor de leitura da entrada em pull-up
    TRISB.RB1 = 1;  // configura pino RB1 como entrada no PORTB
    PORTB.RB1 = 1;  // valor de leitura da entrada em pull-up

    // configurar os pinos de acionamento de cada display de 7 segmento
    TRISD = 0;      // define o PORTD
    PORTD = 0;      // inicializa o display desligado

    // configuracao geral do TMR0
    T0CON = 0B00000100;  // inicialmente desligado, opera como timer, uso do clock, razao do prescaler: 100 (32)
    T0CON.TMR0ON = 1;    // liga o timer no registrador T0CON
}

void ConfigINT(){
    INTCON.GIEH = 1; // configuracao global das interrupcoes GIE   
    RCON.IPEN = 1;  // habilita niveis de prioridade
    INTCON2.RBPU = 0; // RBPU acionado

    // configurando INT0
    INTCON.INT0IF = 0; // flag responsavel em acionar a interrupcao
    INTCON.INT0IE = 1; // habilita a interrupcao especifica INT0
    INTCON2.INTEDG0 = 1;  // define a interrupcao na borda de subida (ao soltar a tecla)

    // configurando INT1
    INTCON3.INT1IF = 0; // flag responsavel em acionar a interrupcao
    INTCON3.INT1IE = 1; // habilita a interrupcao especifica INT1
    INTCON2.INTEDG1 = 1; // define a interrupcao na borda de subida(ao soltar a tecla)
    INTCON3.INT1IP = 1; // define prioridade em INT1
}

void ConfigTIMER() {
    // funcao de configuracao do TMR0 a cada iteracao (verifica mode e limpa a flag)

    // valores iniciais carregados no timer
    if(mode){ // contagem de 0,25s
        TMR0L = 0xF7;
        TMR0H = 0xC2;
    } else { // contagem de 1s
        TMR0L = 0xDC;
        TMR0H = 0x0B;
    }

    INTCON.TMR0IF = 0 ; // limpa a flag de overflow da contagem
}

void DelayTMR0(){  
    while(INTCON.TMR0IF != 1);
}

void Incremento(unsigned char Contador) {
    // contagem do display
    switch (Contador){     
        // acionamento do display de 7 segmentos (PORTD)
        case 0:{ latd = 0b00111111; break;}   // 0 no display de 7 segmentos
        case 1:{ latd = 0b00000110; break;}   // 1 no display de 7 segmentos
        case 2:{ latd = 0b01011011; break;}   // 2 no display de 7 segmentos
        case 3:{ latd = 0b01001111; break;}   // 3 no display de 7 segmentos
        case 4:{ latd = 0b01100110; break;}   // 4 no display de 7 segmentos
        case 5:{ latd = 0b01101101; break;}   // 5 no display de 7 segmentos
        case 6:{ latd = 0b01111101; break;}   // 6 no display de 7 segmentos
        case 7:{ latd = 0b00000111; break;}   // 7 no display de 7 segmentos
        case 8:{ latd = 0b01111111; break;}   // 8 no display de 7 segmentos
        case 9:{ latd = 0b01101111; break;}   // 9 no display de 7 segmentos
        default:{ PORTD = 0b00111111; ucContador = 0; break;} // zera todo o PORTD e reincia o contador
    }
}

void Contagem() {
    Incremento(++ucContador);  // recebe o incremento do contador p/ o display de 7 segmentos
    DelayTMR0();
}

void INTERRUPCAO_HIGH() iv 0x0008 ics ICS_AUTO {
    // vetor de tratamento da interrupcao (endereco fixo 0x0008)

    // tratamento INT0
    if(INTCON.INT0IF == 1){ // verifica se a INT0 ocorreu
        mode = 0;
        ConfigTIMER();
        contando = 1;
        INTCON.INT0IF = 0; // zera flag 
        Delay_ms(40);   // delay de 40ms
    }
    
    // tratamento INT1
    if(INTCON3.INT1IF == 1){ // verifica se a INT1 ocorreu
        mode = 1;
        ConfigTIMER();
        contando = 1; 
        INTCON3.INT1IF = 0; // zera flag 
        Delay_ms(40);   // delay de 40ms
    }
} 

void main() {
    ConfigMCU();
    ConfigINT();
    
    while(1){   // segura o processamento (pooling)
        if(contando){
            Contagem(); // realiza a contagem em loop
        }
    }
}