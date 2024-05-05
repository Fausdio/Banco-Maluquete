#include "dbstart.prg"

PROC MAIN

LOCAL nDecide
LOCAL nSaldo := 0
LOCAL nSaque
LOCAL nDeposito
SET DECIMALS TO 2
hb_cdpSelect("UTF8")
dbstart()
cls

? "Bem vindo ao banco Crazy Bank!"

DO WHILE (nDecide != 3) //condição para o programa seguir executando

USE cc
GO BOTTOM //acessando a última linha do banco para printar sempre o valor atualizado
? "Saldo atual: ", saldo
? "O que deseja realizar? Digite o número da opção equivalente" 
? "1 - Sacar valor"
? "2 - Depositar Valor"
? "3 - Sair"

INPUT "" to nDecide

DO CASE

CASE (nDecide = 1)

    INPUT "Qual o valor que deseja sacar? " to nSaque

    INT(nSaque)
    IF (nSaque > saldo)
    ? "Saldo Insuficiente. Pressione alguma tecla para continuar..."
    inkey(0)
    cls

    ELSEIF (nSaque <= saldo)
    nSaldo := saldo - nSaque

    ? "Saque realizado! O novo saldo é " , saldo

    ? "Pressione alguma tecla para continuar..."

    APPEND BLANK
    REPLACE saldo WITH nSaldo //atualiza o saldo no db
    inkey(0)
    cls
    ENDIF

CASE (nDecide = 2)

    INPUT "Qual o valor que deseja depositar? " to nDeposito

    nSaldo := saldo + nDeposito

    cls
    ? "Depósito realizado com sucesso! Saldo atual: ", nSaldo
    ? "Pressione alguma tecla para continuar..."
    
    APPEND BLANK
    REPLACE saldo WITH nSaldo //atualiza o saldo no db
    inkey(0)
    cls

CASE (nDecide = 3)
    
    cls
    ? "Obrigado por utilizar os serviços Crazy Bank! O banco maluquete."
    USE //fecha o banco
    DELETE FILE ("cc.dbf") //Deleta o banco para uma nova execução limpa 
    inkey(0)
    cls
    
OTHERWISE

cls
? "Xii, Você digitou uma opção inválida. Chato né \__(°-°)__/"
? "."
    inkey(1)

? ".."
    inkey(1)

? "..."
    inkey(1)

? "...."
    inkey(1)

cls

ENDCASE

ENDDO