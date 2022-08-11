from faker import Faker
fake = Faker()


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