if [ "$1" == "" ]
then
	echo "Execução incorreta! Utilize $0 dominio.com.br"
else
	clear
	echo "Reconhecimento Web do dominio: $1"
	#especifica wordlist
	for palavra in $(cat /usr/share/dirb/wordlists/small.txt)
	do
		resposta1=$(curl -s -o /dev/null -w "%{http_code}" $1/$palavra/)
		if [ $resposta1 == "200" ]
		then
			echo "Diretorio encontrado: $1/$palavra"
		fi
		resposta2=$(curl -s -o /dev/null -w "%{http_code}" $1/$palavra)
		if [ $resposta2 == "200" ]
		then	
			echo "Arquivo encontrado: $1/$palavra"
		fi
	done
