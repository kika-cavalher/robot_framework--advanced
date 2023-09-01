from base64 import encode
import bcrypt
from faker import Faker
fake = Faker()

#Criação de metodo que cria senhas cryptografadas. 
def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))
    return hashed


def factory_user():
    first_name = fake.first_name()

    return {
        'name': fake.first_name(),
        'lastname': fake.last_name(),
        'email': first_name.lower() + '@gmail.com',
        'password': 'Kika1234'
    }

def factory_wrong_email():
    first_name = fake.first_name()

    return {
        'name': fake.first_name(),
        'lastname': fake.last_name(),
        'email': first_name.lower() + '&gmail.com',
        'password': 'Kika1234'
    }

def factory_user_login():

    return {
        'name': 'Erica',
        'lastname': 'Cavalher',
        'email': 'erica.cavalher@gmail.com',
        'password': 'Kika1234'
    }