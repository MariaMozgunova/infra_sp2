В этом проекты вы найдёте Dockerfile и docker-compose.yaml. Последний указанный файл запускает два котейнера: API отзывов о фильмах, книгах и песнях - yamdb, и базу данных PostgreSQL для хранения записей yamdb.

### Предварительные требования использования приложения
- Docker

P.S. Можно установить Docker Toolbox, если у вас Windows более раннего выпуска, нежеле Windows 10.

### Запуск приложения
1. Склонируйте репозиторий `git clone https://github.com/MariaMozgunova/infra_sp2.git [<dir_name>]`;
2. Перейдите в папку командой `cd [<dir_name>]`;
3. Придумате пароль для суперпользователя базы данных приложения;
4. Откройте файл конфигураций `nano .env`;
5. Если вы установили Docker Toolbox, то замените IP адрес в первой строке, после символа `@`, на 192.168.99.100;
6. В первой строчке вместо фразы `password_here` введите придуманный пароль;
7. Запустите контейнеры `docker-compose up -d`;
8. Перейдите на `localhost:8000` и проверьте, что видите надпись "Not Found". Если вы установили Docker Toolbox, приложение будет запущено по адресу `http://192.168.99.100:8000/`.

Отлично! Всё работает.

### Заполнение базы начальными данными
1. Выполните команду `docker container ls`, чтобы увидеть CONTAINER ID контейнера с полем IMAGE = postgres:12.4;
2. Выполните вход в контейнер командой `docker exec -it <CONTAINER ID> bash`;
3. Обновите пакет sudo:
   - Обновить список пакетов `apt update`;
   - Установите пакет sudo `apt-get install sudo`;
4. Запустите интерактивную оболочку базы данных командой `sudo -u postgres psql`;
5. В интерактивной оболочке: 
   - создайте базу данных `CREATE DATABASE api;`;
   - создайте пользователя и укажите придуманный в пункте 3 (заголовок "Запуск приложения") пароль `CREATE USER api_user WITH ENCRYPTED PASSWORD 'password_here';`;
   - дайте пользователю все права при работе с базой api `GRANT ALL PRIVILEGES ON DATABASE api TO api_user;`;
   - выйдите из интерактивной оболочки `\q`.
   Выйдите из контейнера командой `exit`.
6. Выполните команду `docker container ls` ещё раз, чтобы увидеть CONTAINER ID контейнера с полем IMAGE = infra_sp2_web;
7. Выполните вход в контейнер самого api командой `docker exec -it <CONTAINER ID> bash`;
8. Запустите терминал django-проекта `python3 manage.py shell` и выполните следующие команды:  
   - `from django.contrib.contenttypes.models import ContentType`;
   - `ContentType.objects.all().delete()`;
   - `quit()`.
9. И, наконец, загрузите тестовые данный в базу `python manage.py loaddata initial_data.json`;
