# Analisador Léxico para a LA(Linguagem Algorítmica)
Projeto desenvolvido para a disciplina de Construção de Compiladores no período ENPE-2020/2.

A linguagem LA foi desenvolvida pelo professor Jander Moreira, no âmbito do DC/UFSCar.

## Grupo:
- Matheus Schmidt Figueiredo \[758616\]
- Pabolo Vinícius da Rosa Pires \[760648\]

## Dependências
Os testes foram realizados em uma máquina linux com as seguintes dependências:

- Apache Maven 3.6.3
- Java 11
- gcc 10.2.1
- Corretor Automático [[GitHub]](https://github.com/dlucredio/compiladores-corretor-automatico)

## Execução
Para executar os casos de teste use o comando:

```
java -jar <caminho-corretor> "java -jar <caminho-analisador>" gcc <pasta-saida> <pasta-casos-de-teste> "[RA dos alunos]" lexico
```

Exemplo:

```
java -jar $PWD/corretor.jar "java -jar $PWD/analisador-lexico.jar" gcc $PWD/tmp/ $PWD/casos-de-teste/ "758616, 760606" lexico
```

O programa executará todos os casos de teste do analisador léxico e apresentará o resultado no final.

## Compilação
Para compilar o programa basta utilizar o comando:

```
mvn install
```

Este comando irá gerar a pasta `target` que contém o programa compilado e os testes podem serem executados com o comando.

```
java -jar $PWD/corretor.jar "java -jar $PWD/target/la-1.0-SNAPSHOT-jar-with-dependencies.jar" gcc $PWD/tmp/ $PWD/casos-de-teste/ "758616, 760648" lexico
```
