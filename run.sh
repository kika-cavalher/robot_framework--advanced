#Rodas esse arquivo
# ./run.sh 


#Limpar Banco. 
robot -l NONE -o NONE -r NONE Front/tasks/Delorean.robot

######Rodar todos os testes SignUp######
#robot -d ./logs -i happy_way Front/tests/2.Signup.robot
#robot -d ./logs Front/tests/2.Signup.robot

######Rodar todos os testes Auth######
#robot -d ./logs Front/tests/1.Signin.robot

######Rodar todos os testes Geek######
robot -d ./logs Front/tests/4.AttemptBeGeek.robot
#robot -d ./logs Front/tests/3.Geek.robot




