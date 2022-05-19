#!/bin/bash
#iniciar uma máquina virtual ja instalada em um disco virtual (QEMU).

read -p "Já há um sistema instalado em um disco virtual sim ou nao ?" $DECISAO
read -p "nome do disco onde o sistema está instalado: " $NOME

if [[ $DECISAO == 'sim' || $DECISAO == 's' || -e $NOME ]]; then
	echo "qemu-sytem-x86_64 -m 1024M -display sdl -hda $NOME -boot c -enable-kvm"
	qemu-sytem-x86_64 -m 1024M -display sdl -hda $NOME -boot c -enable-kvm
	echo "virtualização finalizada."
else
	echo "cancelado."
	echo "ou o nome do disco está errado."
	exit 0
fi

