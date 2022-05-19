#!/bin/bash

DIRETORIOBACKUP='/mnt/luiz'

echo -e "\n\n--ATENÇÂO ESTE SCRIPT NÃO PODE SER EXECUTADO POR ROOT !!!--\n\n"
lsblk
read -p "A partição /dev/sdb1 está montada em /mnt? sim ou nao: " SELECAO

#a única variavel de ambiente que muda após o comando su é $HOME

#se o usuario não montou /dev/sdb1 em /mnt então cancela.
if [[ ! -d $DIRETORIOBACKUP ]]; then
	echo "/mnt/luiz não existe, isso significa que você não montou a partição /dev/sdb1 em /mnt."
	echo "script encerrado por seguraça."
	exit 0
fi

if [[ $SELECAO == 'sim' && $HOME != '/root' ]]; then
	echo "Sicronizando diretórios padrões-xdg de sua home para /mnt/luiz ..."
	rsync -a -v -h --delete Desktop Documentos Downloads Imagens Modelos Música Público Vídeos /mnt/luiz
	echo "Operação concluida"
	exit 0
elif [[ $HOME == '/root' ]]; then
	echo -e "PERIGO VOCE ESTA LOGADO COMO ROOT\npor segurança este script não pode ser executado por root!"
	env | grep HOME
	exit 0
else
	exit 0
fi

if [[ $SELECAO == 'nao' ]]; then
	echo -e "Então, como root, monte a partição /dev/sdb1 em /mnt"
	echo -e "e tente novamente. BURRO"
	exit 0
fi

