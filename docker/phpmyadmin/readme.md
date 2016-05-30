[![Docker pulls](https://img.shields.io/docker/pulls/nazarpc/phpmyadmin.svg?label=Docker pulls)](https://registry.hub.docker.com/u/nazarpc/phpmyadmin/)
[![Docker stars](https://img.shields.io/docker/stars/nazarpc/phpmyadmin.svg?label=Docker stars)](https://registry.hub.docker.com/u/nazarpc/phpmyadmin/)

# phpMyAdmin as Docker container
This container may be used with MySQL or MariaDB linked containers.

If you like this image - you may also like set of images for [WebServer](https://github.com/nazar-pc/docker-webserver).

#How to use
With MySQL:
```bash
docker run --name mysql -e MYSQL_ROOT_PASSWORD=my_password -d mysql
docker run --rm --link mysql:mysql -p 1234:80 nazarpc/phpmyadmin
```

With MariaDB:
```bash
docker run --name mariadb -e MYSQL_ROOT_PASSWORD=my_password -d mariadb
docker run --rm --link mariadb:mysql -p 1234:80 nazarpc/phpmyadmin
```
(internally it should be called `mysql` anyway)

After these commands you'll be able to access phpMyAdmin via `http://localhost:1234`, press `Ctrl+C` to stop container, and it will be removed automatically (because of `--rm` option). Feel free to change `1234` to any port you like.

# Specify allowed upload file size
Sometimes it is necessary to upload big dump which doesn't fit into default limit 128M. You can specify alternative size via environment variable `UPLOAD_SIZE`:
```bash
docker run --rm --link mysql:mysql -p 1234:80 -e UPLOAD_SIZE=1G nazarpc/phpmyadmin
```

# Customize host name
By default phpMyAdmin assumes MySQL is available through `mysql` hostname. Sometimes this is not the case, so you can override this with environmental variable `MYSQL_HOST`:
```bash
docker run --rm --link mysql:mysql -p 1234:80 -e MYSQL_HOST=mariadb:9999 nazarpc/phpmyadmin
```
Examples of valid `MYSQL_HOST`:
* `mariadb` - hostname `mariadb`
* `mariadb:9999` - hostname `mariadb` with port `9999`
* `mysql, mariadb:9999` - multiple servers

# Allow connecting to arbitrary MySQL host
```bash
docker run --rm --link mysql:mysql -p 1234:80 -e ALLOW_ARBITRARY=1 nazarpc/phpmyadmin
```

# Custom URI of phpMyAdmin instance
Sometimes phpMyAdmin may determine its own URI incorrectly. Usually you can fix it by correcting virtual host of revers proxy,  but sometimes it might be useful to specify URI explicitly:
```bash
docker run --rm --link mysql:mysql -p 1234:80 -e ABSOLUTE_URI=https://domain.tld/phpmyadmin nazarpc/phpmyadmin
```

# Difference from other similar images with phpMyAdmin
This image doesn't use any custom base, just official PHP 5.6 container with built-in Apache2 web server.
There is support for importing SQL dumps in all compression formats supported by phpMyAdmin.
There is possibility to connect to multiple servers of your choice or even to arbitrary servers if necessary.

Also this image generates `blowfish_secret` configuration option (unique for each container instance, you don't have to rebuild it yourself) on each container start, so that you will automatically use cookie sessions (for your convenience).

Plus, I'll try to keep it up to date with new releases of phpMyAdmin (as well as PHP itself and other software inside image), so, by using `nazarpc/phpmyadmin` image you'll always have latest versions.

#Questions?
Open an issue and ask your question there:)

#License
Public Domain
