install_php_composer() {
  rm -rf /tmp/composer-setup.php
  php -r "copy('https://getcomposer.org/installer', '/tmp/composer-setup.php');"
  php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer --quiet
  rm -rf /tmp/composer-setup.php
}
