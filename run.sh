#Rodas esse arquivo
# ./run.sh 


robot -d ./Backend/logs ./Backend/tests
pabot -x xunit.xml -d ./Frontend/logs ./Frontend/tests


