# Instalacao
1. **Entre na pasta do neo-misige-api e clone o submódulo misige laradock usando o comando**
``` bash
    git clone https://github.com/Clifton-f/misige-laradock.git
```

2. **Renomeie o ficheiro .env.example para .env e altere de acordo com as suas necessidades**

3. **instale as dependencias**
``` bash
    composer install
    coposer update
```

4. **Abra o a pasta misige-laradock e renomeie o ficheiro .env.example para .env e altere de acordo com as suas preferências**

5. **Inicie os containers mariadb apache2 e phpmyadmin**
``` bash
docker compose up -d  mariadb apache2 phpmyadmin
```
6. **Gere a key**
``` bash
php artisan key:generate
```
7. **Gere a o secret do JWT**
``` bash
php artisan jwt:secret
```
# Documentacão da API Rest
https://documenter.getpostman.com/view/38538260/2sAXxPAYjj#4e707002-7f8d-405c-a1f2-e32d70aca759
