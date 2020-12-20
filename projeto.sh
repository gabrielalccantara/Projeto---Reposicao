#!/bin/bash


echo "Olá! Você está agora no WINDOWS EXPLORER."

while true; do
  echo -e "Esses são seus arquivos:\n "
 
 for i in $(ls); do
    if [ -f $i ];then
       echo "$i"
    fi
  done

  echo "----------------------------------------------"
  echo -e "Esses são seus diretórios:\n " 

  for i in $(ls); do
    if [ -d $i ]; then
       echo "$i"
    fi
  done

  echo "----------------------------------------------"
  echo " 1: Acessar um diretório"
  echo " 2: Editar um arquivo"
  echo " 3: Voltar um diretório"
  echo " 4: Remover um arquivo"
  echo " 5: Remover um diretório"
  echo " 6: Realizar backup de um arquivo ou diretório"
  echo " 7: Listar diretório atual "
  echo " 8: Pré-visualizar arquivo "
  echo " 9: Ler um arquivo "
  echo " 10: Compactar um arquivo "
  echo " 11: Descompactar um arquivo "
  echo " 12: Criar um diretório "
  echo " 13: Criar um arquivo "
  echo " 14: Sair do Windows Explorer"
  echo " ----------------------------------------------"
  read -p "Qual tarefa deseja realizar? " reply
  
  if [ $reply == "1" ]; then
      read -p "Qual diretório deseja acessar? " diretorio
      if test -d $diretorio; then
         cd /$diretorio
      else 
         "Nome de diretório inválido, tente novamente!"
      fi
  fi
  
  if [ $reply == "2" ]; then
     read -p "Digite o nome do arquivo que deseja editar: " arq
     if test -f $arq; then
        nano $arq
     fi
  fi

  if [ $reply == "3" ]; then
     cd -
     if [ $(pwd) == "/" ]; then
        echo "Você está no diretório raiz, não é possível voltar níveis"
     fi
  fi
 
  if [ $reply == "4" ]; then
     read -p "Digite o nome do arquivo a ser removido: " name
     if  test -f $name; then
         rm -r $name
         echo "Arquivo removido com sucesso!"
     else
       echo "Arquivo inexistente "
     fi
  fi
  
  if [ $reply == "5" ]; then
     read -p "Digite o nome do diretório a ser removido: " name
     if test -d $name; then
        rm -r $name
        echo "Diretório removido com sucesso!"
     else
        echo "Diretório inexistente, tente novamente"
     fi
  fi

  if [ $reply == "6" ]; then
      read -p "Qual arquivo ou diretório deseja realizar backup? " SRCDIR
      read -p "Onde deseja salvar esse arquivo? " DESDIR
      TIME=`date +%b-%d-%y`
      FILENAME=Backup-$TIME.tar.gz
      tar -cpzf $DESDIR/$FILENAME $SRCDIR
      echo "Backup realizado com sucesso!"
  fi
  
  if [ $reply == "7" ]; then
     pwd
  fi
  
  if [ $reply == "8" ]; then
     read -p " Digite o nome do arquovo a ser pré-visualizado: " preview
     if test -f $preview; then
        head $preview
        echo "---------------------------------------"
        tail $preview
     else
        echo  "O arquivo não existe ou está corrompido"
     fi
  fi
 

  if [ $reply == "9" ]; then 
     read -p "Qual arquivo você deseja abrir? " arq
     if test -f $arq; then
        cat $arq
     else
        echo "O arquivo não existe"
     fi
  fi
  
  if [ $reply == "10" ]; then
     read -p "Qual arquivo deseja compactar? " arq
     name=$arq
     if test -f $arq; then
        zip $name.zip $arq
     else 
        echo "O arquivo não foi encontrado"
     fi
  fi
  
  if [ $reply == "11" ]; then
     read -p "Qual arquivo você deseja descompactar? " arq
     if test -f $arq; then
        unzip $arq
     else 
        "O arquivo não foi encontrado"
     fi
  fi
  
  if [ $reply == "12" ]; then
     read -p "Qual o nome do diretório que deseja criar? " dir
     mkdir $dir
     echo "Diretório criado com sucesso!"
  fi

  if [ $reply == "13" ]; then
      read -p "Qual o nome do arquivo que deseja criar? " arq
      touch $arq
  fi
  
  if [ $reply == "14" ]; then
      exit 1
  fi

done
