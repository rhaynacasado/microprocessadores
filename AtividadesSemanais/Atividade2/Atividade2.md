<h1> Atividade Semanal 2 </h1>
<h2> SEL0614 - Aplicação de Microprocessadores (2024) </h2>

### Discentes: 
Marcelo Eduardo Reginato

Rhayna Christiani Vasconcelos Marques Casado

Docente: Pedro Oliveira
Data: 14/08/2024


### Questão 3
#### Recorra ao exemplo do microcontrolador aplicado ao controle de um elevador que foi apresentado em aula, disponível nas transparências do Cap. 1. De acordo com seu ponto de vista, quais as vantagens de se utilizar um microcontrolador para aquele tipo de aplicação e qual deve ser o “perfil” de um microcontrolador ideal para aquela aplicação do elevador em termos de capacidade da CPU (baixa, média ou alta), quantidade de bits no barramento, e precisão no tratamento das informações (operação somente com inteiros ou ponto flutuante?)
A vantagem de se utilizar um microcontrolador neste projeto envolve a possibilidade de especificação do sistema para a aplicação específica, dado que, assim, é possível assegurar uma maior eficiência energética, redução de tamanho, flexibilidade de implementação e modificação e integração com sensores e atuadores.

O perfil ideal envolve uma baixa capacidade de CPU por ser um projeto mais simples (poucas funcionalidades e sem necessidade de paralelismo), barramento de 8 ou 16 bits (a depender dos demais componentes do projeto e interação entre eles - aumento de complexidade do produto) e baixa precisão no tratamento de informações (utilização somente de inteiros) pela simplicidade das tarefas desempenhadas pelo sistema. 

### Questão 4
#### Quanto às portas paralelas de um microcontrolador:
( ) São somente de entrada.

( ) São somente de saída.

( ) Cada palavra (A, B, C, P1, P2, P3…) pode ser configurada como entrada ou saída.

(X) Cada bit pode ser configurado como entrada ou saída.

( ) Cada palavra (A, B, C... P1, P2, P3…) pode ser configurada como entrada, saída ou bidirecional.

( ) Cada bit pode ser configurado como entrada, saída ou bidirecional.

### Questão 5
#### Assinale V para verdadeiro e F para falso nas afirmações abaixo:
(V) No modelo de Von Neumann, o microprocessador segue as instruções armazenadas na memória ROM (programas), lê as entradas e envia comandos sobre os canais de saída, alterando as informações contidas na memória RAM.

(F) Os registradores Special Function Registers localizam-se sempre internos à CPU.

(F) O ciclo de máquina é composto pelo ciclo de busca mais o ciclo de execução, cada qual demorando um pulso de clock.

(V) A instrução “CLR A” não possui operando e gasta apenas 1 ciclo de máquina

(V) A arquitetura Von Neumann é considerada uma arquitetura mais simples do que a arquitetura Harvard porque utiliza o mesmo barramento para o tráfego de dados e de instruções.

(F) A técnica de pipeline é impossível de ser utilizada em computadores de arquitetura Von Neumann.

### Questão 6
#### Indique quais afirmativas se aplicam a uma instrução CISC e quais a uma instrução RISC:
CISC:

➔ Mais instruções disponíveis

➔ Programas menores

➔ Processamento de cada instrução é mais lento


RISC:

➔ Os programas são mais complexos

➔ A maioria das instruções tem a mesma duração

➔ Utiliza menos espaço na memória de programa

➔ Microcontroladores PIC, AVR, ARM

➔ Tempo de execução das instruções depende da frequência do clock.

### Questão 7
#### Abaixo é apresentado o diagrama de um microcontrolador. Qual a arquitetura utilizada e como chegamos a essa conclusão? Quantas portas I/O bidirecional e quantas linhas (bits/pinos) são endereçados de forma individual neste microcontrolador, com base neste diagrama?

<img src = "./ativ2-fig1.png"/>

A figura apresenta um diagrama Von Neumann, devido ao compartilhamento do barramento pelos dados e pelas instruções. Na arquitetura existem 4 portas I/O bidirecionais (P0, P1, P2 e P3) e 32 linhas são endereçadas individualmente (8 por porta).