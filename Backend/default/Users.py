
def factory_session_user(target):
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
        },        
        'session_token': {
            'email': 'bags@lolis.com',
            'password': 'Kika.1234'
        }
    }

    return data[target]

def factory_user(target):
    data = {
        'signin': {
            'name': 'Baguera Loli',
            'email': 'bags@lolis.com',
            'password': 'Kika.1234'
        }
    }

#otimizar a utilização dos testes
    return data[target]