def factory_api_user(target):
    data = {
        'signin': {
            'name': 'Lolita Bags',
            'email': 'lolita@bag.com',
            'password': 'Kika.1234'
        },
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