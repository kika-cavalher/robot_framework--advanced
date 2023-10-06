# API Users

## Sessions

### User login
`Dado que o usuario submeteu o formulario de login com os dados corretos`
`Quando faço uma requisição para a rota /sessions`
`Então o ststus code deve ser igual a 200`
`E deve retornar um token JWT na resposta`
`E Esse token deve expirar em 10 dias.`

### Incorrect pass
`Dado que o usuario submeteu o formulario de login com senha inválida`
`Quando faço uma requisição para a rota /sessions`
`Então o ststus code deve ser igual a 401`
`E deve retornar a mensagem Unauthorized`

### User dont exist
`Dado que o usuario submeteu o formulario de login com email não cadastrado`
`Quando faço uma requisição para a rota /sessions`
`Então o ststus code deve ser igual a 401`
`E deve retornar a mensagem Unauthorized`

### Incorrect email
`Dado que o usuario submeteu o formulario de login com incorrect format email `
`Quando faço uma requisição para a rota /sessions`
`Então o ststus code deve ser igual a 400`
`E deve retornar a mensagem Incorrect email`

### Blank email
`Dado que o usuario submeteu o formulario de login sem o email `
`Quando faço uma requisição para a rota /sessions`
`Então o ststus code deve ser igual a 400`
`E deve retornar a mensagem Required email`

### Without email
`Dado que o usuario submeteu o formulario de login sem o campo email `
`Quando faço uma requisição para a rota /sessions`
`Então o ststus code deve ser igual a 400`
`E deve retornar a mensagem Required email`

### Blank password
`Dado que o usuario submeteu o formulario de login sem o pass `
`Quando faço uma requisição para a rota /sessions`
`Então o ststus code deve ser igual a 400`
`E deve retornar a mensagem Required pass`

### Without password
`Dado que o usuario submeteu o formulario de login sem o campo pass `
`Quando faço uma requisição para a rota /sessions`
`Então o ststus code deve ser igual a 400`
`E deve retornar a mensagem Required pass`
