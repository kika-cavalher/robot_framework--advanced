
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

def factory_geek(target):

    data = {    
        'be_geek': {
            'name': 'Baguera Loli' ,
            'email': 'bags@lolis.com',
            'password': 'Kika1234',
            'geek_profile': {
                'whatsapp': '11999999999',
                'desc': 'Sou bom em abrir embalagem de pc, depois me esconder e arranhar ela. Eu já destruir inumeras embalagens, as vezes com a boca, as vezes com a unha, mas pode ficar tranquilo que eu sempre consigo!',
                'printer_repair': 'Sim',
                'work': 'Remoto',
                'cost': '500'
                }
            },
            'list_geeks': [
                    {
                    'name': 'Riri Willians',
                    'email': 'riri@marvel.com',
                    'password': 'pwd123',
                    'geek_profile': {
                        'whatsapp': '11999999999',
                        'desc': 'Seu computador está lento? Reiniciando do nada? Talvez seja um vírus, ou algum hardware com defeito. Posso fazer a manutenção no seu PC, formando, reinstalando o SO, trocando algum componente físico e porque não remover o baidu ou qualquer outro malware.',
                        'printer_repair': 'Não',
                        'work': 'Presencial',
                        'cost': '100'
                        }
                    },
                    {
                    'name': 'Arnim Zola',
                    'email': 'zola@hidra.com',
                    'password': 'pwd123',
                    'geek_profile': {
                        'whatsapp': '21999999999',
                        'desc': 'Instalo Distros Ubuntu, Debian, ElementaryOS, PopOS, Linux Mint, Kurumin, Mandrake, Connectiva, Fedora, RedHat, CentOS, Slackware, Gentoo, Archlinux, Kubuntu, Xubuntu, Suze, Mandriva, Edubuntu, KateOS, Sabayon Linux, Manjaro Linux, BigLinux, ZorinOS, Unit',
                        'printer_repair': 'Não',
                        'work': 'Ambos',
                        'cost': '110'
                        }
                    },
                    {
                    'name': 'Reed Richards',
                    'email': 'reed@fantastic4.com',
                    'password': 'pwd123',
                    'geek_profile': {
                        'whatsapp': '31999999999',
                        'desc': 'Instalado e faço manutenção em qualquer tipo de impressora, matricial padrão, matricial fiscal, a jato, a cera, a laser e até 3D. Também faço remold de fitas coloridas para Epson LX300. ',
                        'printer_repair': 'Sim',
                        'work': 'Remoto',
                        'cost': '120'
                        }
                    }
                ]
            }


#otimizar a utilização dos testes
    return data[target]