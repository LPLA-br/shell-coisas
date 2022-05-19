#!/bin/bash
#Guia rápido criado por luiz para o luiz. Shellscript

#	$# contém o número de argumentos passados para o programa
#	$* contém todos os argumentos passados para o programa
#	*? contém informações sobre o último comando executado
#	$$ contém o número do processo em execução
#	$! contém o número do último processo executado em background

# $VALOR da variavel	\$NOME da variavel

# " "   string com caracteres especiais $\'
# ' '   string sem caracteres especiais
# $''   string interpretadora de sequências de escape como \t \n \a
# ` `   executar comando em um sub-shell retornando o resultado
# { ; } agrupar comandos em um bloco ex: { date ; ls -l }
# (  )  executar comandos em uma sub-shell
# $(  ) executar comandos em uma sub-shell retornando o resultado
# ((  )) testa operação lógica retornando 0 ou 1 ex: ((5>3))
# $((  )) retorna o resultado de uma operação aritmética
# [  ] testa uma expressão retornando 0 ou 1 ex: [5 -gt 3]
# [[  ]] testa uma expressão retornando 0 ou 1 podendo usar operadores
#        lógicos && ||

#COMANDO test ou [] OPÇÕES
# COMPARAÇÃO NUMÉRICA
#  -lt less_than
#  -gt greater_than
#  -le less_or_equal
#  -ge greater_or_equal
#  -eq equal
#  -ne not_equal
# COMPARAÇÃO DE STRINGS
#  =  igual
#  != não igual
#  -n é não nula
#  -Z	é nula
# OPERADORES LÓGICOS
#  !  not
#  -a and
#  -o or
# TESTE EM ARQUIVOS
#  -b é um dispositivo de bloco
#  -c é um dispositivo de caractere
#  -d é um diretório
#  -e o arquivo existe
#  -f é arquivo normal
#  -g o bit SGID está ativado
#  -G o grupo do arquivo é do usuário atual
#  -k o sticky bit está ativado
#  -L o arquivo é um link simbólico
#  -O o dono do arquivo e o usuário atual
#  -p o arquivo é um named pipe
#  -r o arquivo tem permissão de leitura
#  -s o tamanho do arquivo é maior que zero
#  -S o arquivo é um socket
#  -u o bit SUID está ativado
#  -w o arquivo tem permissão de escrita
#  -x o arquivo tem permissão de execução
#  -nt o arquivo é mais recente newerThan
#  -ot o arquivo é mais antigo olderThan
#  -eq o arquivo é o mesmo equalFile

#CURINGAS PARA NOMES DE ARQUIVOS
#  * 	Qualquer coisa			*.txt
#  ? 	Um caractere qualquer			arquivo-??.zip
#  [...] 	Qualquer um dos caracteres listados			[Aa]rquivo.txt
#  [^...] 	Qualquer um caractere, exceto os listados			[^A-Z]*.txt
#  {...} 	Qualquer um dos textos separados por vírgula			arquivo.{txt,html}

read -p "Insira 1 ou 2 ou 3:" GLOBAL

VARIAVEL="valor"
VARIAVEL2=22
MATRIZ=("um" "dois" "três")

funcao()
{
	#variáveis não são tipadas
	VALOR=10

	#iterações
	for ((VALOR = 10; VALOR>0; VALOR--)); do
		echo "$VALOR"
		if [[ $VALOR == 5 ]]; then
			continue
			echo "AAA"
		fi
	done

	while [[ $VALOR < 10 ]]; do
		echo "$VALOR"
		break
		#(($VALOR--))	NÃO FUNCIONA POR MOTIVO DESCONHECIDO.
	done

	#semelhante ao do while de C
	until [ $VALOR == 0 ]; do
		echo -e "\n$VALOR VALORES"
		(($VALOR--))
	done
}

selecao()
{

	read -p "digite algo:" ARGUMENTO2
	echo -e $ARGUMENTO2

	if [ $ARGUMENTO2 == 'egg' ]; then
		echo -e "\nOvo de pascoa"
	elif [ $ARGUMENTO2 == 'nokia' ]; then
		echo -e "\nNokia tijolão"
	else
		echo -e "\n-não reconhecido-"
	fi
}

forin()
{

for VALOR in 1 2 3 do
#	echo "${MATRIZ[VALOR]}"
done

for NUMERO in 1 2 3 4 5 6 7 8 9; do
	if [[ $NUMERO -eq 5 ]]; then
		continue
	fi

	echo -e "número: $NUMERO"
done
}

#estrutura de switch
case $GLOBAL in
	1) funcao ;;
	2) selecao ;;
	3) forin ;;
esac

echo -e "__FIM__"
