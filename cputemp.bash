#!/bin/bash
#criado por luiz versão1
#depende de lm_sensors

if [[ $1 == '-c' ]]; then
	sensors | grep 'CPUTIN'
elif [[ $1 == '--version' ]]; then
	echo versão 1, criado por luiz paulo de lima araujo
else
	echo consulte a página man para usar este software.
fi