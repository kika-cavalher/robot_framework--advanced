from base64 import encode
import bcrypt
from faker import Faker
fake = Faker()

#Criação de metodo que cria senhas cryptografadas. 
# get_hashed_pass já vem da lib bcrypt 
def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))
    return hashed


def factory_user(target):
    first_name = fake.first_name()

    data = {
        'faker': {
            'name': fake.first_name(),
            'lastname': fake.last_name(),
            'email': first_name.lower() + '@gmail.com',
            'password': 'Kika1234'
        },
        'wrong_email': {
            'name': fake.first_name(),
            'lastname': fake.last_name(),
            'email': first_name.lower() + '&gmail.com',
            'password': 'Kika1234'
        },
        'login': {
            'name': 'Erica',
            'lastname': 'Cavalher',
            'email': 'erica.cavalher@gmail.com',
            'password': 'Kika1234'
        },
        'be_geek': {
            'name': 'Bags',
            'lastname': 'Loli',
            'email': 'bags.loli@gmail.com',
            'password': 'Kika1234',
            'geek_profile': {
                'whats': '11999999999',
                'desc': 'Sou bom em abrir embalagem de pc, depois me esconder e arranhar ela. Eu já destruir inumeras embalagens, as vezes com a boca, as vezes com a unha, mas pode ficar tranquilo que eu sempre consigo!',
                'printer_repair': 'Sim',
                'work': 'Remoto',
                'cost': '500'
            }   
        }
    }

#otimizar a utilização dos testes
    return data[target]