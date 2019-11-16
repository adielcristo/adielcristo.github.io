---
title: Compilando o PHP a partir do Pacote
tags: php-src
categories: PHP
language: pt-br
---

Então você quer ajudar a comunidade do PHP mas não sabe como? Uma opção é
testar os pacotes <em>Release Candidate</em> da versão 7.4, que deve sair do
forno em duas semanas.

Neste post iremos instalar a versão [php-7.4.0RC6][package-news], lançada na
última quinta-feira.

### Instale as Dependências

Primeiro instale as dependências necessárias. Algumas podem já estar instaladas:

```
sudo apt-get install \
    autoconf \
    bison \
    build-essential \
    git \
    libsqlite3-dev \
    libxml2-dev \
    pkg-config \
    re2c
```

### Baixe o Pacote da Versão

Você pode baixar o pacote diretamente:

```
curl https://downloads.php.net/~derick/php-7.4.0RC6.tar.gz -o php-7.4.0RC6.tar.gz
```

### Verifique a Integridade do Pacote

Se quiser verificar a integridade do pacote você pode baixar as chaves GPG dos
mantenedores dos pacotes do PHP [nesta página][gpg-keys]:

```
curl https://www.php.net/distributions/php-keyring.gpg -o php-keyring.gpg
```

Para importar as chaves, execute:

```
gpg --import php-keyring.gpg
```

Baixe também o arquivo ASC, usado para checar a integridade do pacote: 

```
curl https://downloads.php.net/~derick/php-7.4.0RC6.tar.gz.asc -o php-7.4.0RC6.tar.gz.asc
```

E finalmente, para verificar a integridade do pacote:

```
gpg --verify php-7.4.0RC6.tar.gz.asc php-7.4.0RC6.tar.gz
```

### Extraia o Pacote

Extraia o conteúdo do pacote:

```
tar -zxvf php-7.4.0RC6.tar.gz
```

### Configure o Pacote

Acesse a pasta criada:

```
cd php-7.4.0RC6
```

Para configurar o pacote com as opções básicas de desenvolvimento:

```
./configure \
    --enable-maintainer-zts \
    --enable-debug \
    --enable-cli
```

Se quiser conhecer as muitas opções de configuração disponíveis:

```
./configure --help
```

### Compile o Pacote 

Para compilar o pacote, execute:

```
make
```

Se quiser executar (muito) mais rápido:

```
make -j$(nproc)
```

### Teste o Pacote

Verifique a versão do CLI do PHP que foi gerado:

```
sapi/cli/php --version
```

E quais módulos foram instalados:

```
sapi/cli/php -m
```

Para rodar os testes, execute:

```
make test
```

Se quiser usar mais unidades de processamento, execute:

```
make TEST_PHP_ARGS=-j$(nproc) test
```

Ao final dos testes, será apresentada uma opção para enviar um relatório com os
resultados para o time de qualidade do PHP:

<img src="{{ site.url }}/content/posts/pt-br/2019/11/compilando-o-php-a-partir-do-pacote/qa-report-prompt.png" />

Você pode confirmar (opção padrão) e informar seu e-mail em seguida, ou salvar
os resultados, caso queira enviar depois.

Por enquanto é isso. Bons testes e até a próxima!

[gpg-keys]: https://www.php.net/gpg-keys.php
[package-news]: https://www.php.net/archive/2019.php#2019-11-14-1
[sammy-post]: https://www.sammyk.me/compiling-php-from-source-writing-tests-for-php-source
