#Rodas esse arquivo
# ./run.sh 


#Limpar Banco. 
robot -l NONE -o NONE -r NONE Front/tasks/Delorean.robot

######Rodar todos os testes SignUp######
robot -d ./Front/.logs Front/tests/Signup.robot

######Rodar os testes de SignUp filtrando######
#robot -d ./Front/.logs -i happy_way Front/tests/Signup.robot

######Rodar todos os testes Auth######
# robot -d ./Front/.logs Front/tests/Signin.robot



