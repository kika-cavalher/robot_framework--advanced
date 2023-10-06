#Rodas esse arquivo
# ./run.sh 


#Limpar Banco. 
robot -l NONE -o NONE -r NONE Frontend/tasks/Delorean.robot
pabot -d ./logs Frontend/tests

#pabot diminui o tempo de execução. 

robot -d ./logs users/tests



