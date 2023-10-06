from base64 import encode
import bcrypt
from faker import Faker
fake = Faker()

#Criação de metodo que cria senhas cryptografadas. 
# get_hashed_pass já vem da lib bcrypt 
def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))
    return hashed


def factory_api_user(target):
    first_name = fake.first_name()

    data = {
        'session': {
            'email': 'lolita@bag.com',
            'password': 'Kika.1234'
        },
        'incorrect_pass': {
            'email': 'lolita@bag.com',
            'password': 'Kika1234'
        },
        'user_not_found': {
            'email': 'Bagsbags@lolita.com',
            'password': 'Kika.1234'
        },
        'incorrect_email': {
            'email': 'Bagsbags.lolita.com',
            'password': 'Kika.1234'
        },
        'empty_email': {
            'email': '',
            'password': 'Kika.1234'
        },
        'without_email': {
            'password': 'Kika.1234'
        },
        'empty_pass': {
            'email': 'lolita@bag.com',
            'password': ''
        },
        'without_pass': {
            'email': 'lolita@bag.com'
        }
    }

#otimizar a utilização dos testes
    return data[target]