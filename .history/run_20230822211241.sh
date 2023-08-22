#Rodas esse arquivo
#./ run.sh


#Limpar Banco. 
robot -l NONE -o NONE -r NONE Front/tasks/Delorean.robot

######Rodar todos os testes SignUp######
# robot -d ./logs Front/tests/Signup.robot

######Rodar os testes de SignUp filtrando######
# robot -d ./logs -i happy_way Front/tests/Signup.robot
# robot -d ./logs -i attempt_signup Front/tests/Signup.robot

######Rodar todos os testes Auth######
robot -d ./logs Front/tests/Login.robot

######Rodar os testes de Login filtrando######
# robot -d ./logs -i teste Front/tests/Login.robot
# robot -d ./logs -i attempt_login Front/tests/Login.robot


