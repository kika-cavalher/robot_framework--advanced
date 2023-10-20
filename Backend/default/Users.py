
def factory_session_user(target):
    data = {
        'session': {
            'email': 'bags@lolis.com',
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
        },        
        'session_token': {
            'email': 'bags@lolis.com',
            'password': 'Kika.1234'
        }
    }

    return data[target]

def factory_user(target):

    name = 'Baguera Loli'    
    email = 'bags@lolis.com'


    data = {
        'signin': {
            'name': name,
            'email': email,
            'password': 'Kika.1234'
        },
        'update': {
            'name': name,
            'email': email,
            'whatsapp': '985584356',
            'avatar': 'https://avatars.githubusercontent.com/u/60945965'
        }
    }

#otimizar a utilização dos testes
    return data[target]