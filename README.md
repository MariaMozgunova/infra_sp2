### infra_sp2
Вот мои первые Dockerfile и docker-compose.yaml. Последний указанный файл запускает два котейнера: API отзывов о фильмах, книгах и песнях - yamdb, и базу данны PostgreSQL для хранения записей yamdb.

### Предварительные требования использования приложения
- Docker

P.S. Можно установить Docker Toolbox, если у вас Windows более раннего выпуска, нежеле Windows 10.

### Запуск приложения
1. Склонируйте репозиторий `git clone https://github.com/MariaMozgunova/infra_sp2.git [<dir_name>]`;
2. Перейдите в папку командой `cd [<dir_name>]`;
3. Запустите контейнеры командой `docker-compose up`;
4. Перейдите на `localhost:8000` и проверьте, что сайт заработал. Если вы установили Docker Toolbox, приложение будет запущено по адресу `http://192.168.99.100:8000/`; 
Отлично! Всё работает. Теперь заполним PostgreSQL тестовыми данными.

1. Выполните вход в контейнер командой `docker exec -it <CONTAINER ID> bash`, CONTAINER ID можно вычислить, выполнив команду `docker container ls`;
2. Создайте суперпользователя:
   - Обновить список пакетов `apt update`;
   - Установите пакет sudo `apt-get install sudo`;
   - Создайте пользователя `adduser <username>`;
   - Добавьте нового пользователя в группу sudo `usermod -aG sudo <username>`;

