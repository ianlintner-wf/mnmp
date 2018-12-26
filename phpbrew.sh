#!/usr/bin/env bash
curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew
chmod +x phpbrew

# Move phpbrew to somewhere can be found by your $PATH
sudo mv phpbrew /usr/local/bin/phpbrew

phpbrew init

php_args="phpbrew install 7.2 +default +openssl=/usr/local/Cellar/openssl/1.0.2q +dbs +mb +fpm +pgsql=/usr/local/Cellar/postgresql/11.1 +gettext=/usr/local/Cellar/gettext/0.19.8.1 -- --without-enchant --with-kerberos --without-interbase --without-oci8 --without-adabas --enable-opcache=no --enable-pcntl=no"

[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc
phpbrew lookup-prefix homebrew

# Comment out which ones you don't want to install.

#phpbrew install 7.3 $php_args
phpbrew install 7.2 $php_args
#phpbrew install 7.1 $php_args
#phpbrew install 5.6 $php_args

phpbrew ext install memcached
phpbrew ext install xdebug
