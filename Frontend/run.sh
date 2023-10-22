#Rodas esse arquivo
# .\Frontend\run.sh


#Limpar Banco. 
robot -l NONE -o NONE -r NONE ./tasks/Delorean.robot
robot --xunit xunit.xml -d ./logs ./tests

#pabot diminui o tempo de execução. 

######Rodar todos os testes SignUp######
#robot -d ./Frontend/logs -i happy_way Frontend/tests/2.Signup.robot
#robot -d ./Frontend/logs Frontend/tests/2.Signup.robot

######Rodar todos os testes Auth######
#robot -d ./Frontend/logs Frontend/tests/1.Signin.robot

######Rodar todos os testes Geek######
#robot -d ./Frontend/logs Frontend/tests/4.AttemptBeGeek.robot
#robot -d ./Frontend/logs Frontend/tests/3.Geek.robot




