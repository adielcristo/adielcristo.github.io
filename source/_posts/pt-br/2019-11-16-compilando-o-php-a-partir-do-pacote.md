---
title: Compilando o PHP a partir do Pacote
tags: php-src
categories: PHP
language: pt-br
---

Então você quer ajudar a comunidade PHP mas não sabe como? Uma opção é testar os
pacotes <em>Release Candidate</em> da versão 7.4, que deve sair do forno em duas
semanas.

Neste post iremos instalar a versão [php-7.4.0RC6][package-news], lançada na
última quinta-feira.

_**Nota:** As instruções a seguir foram executadas no ambiente Linux. Ajustes
podem ser necessários para adaptá-las ao seu ambiente._

### Instale as Dependências

Primeiro instale as dependências necessárias. Algumas podem já estar instaladas:

<pre>
<code class="bash">sudo apt-get install \
    autoconf \
    bison \
    build-essential \
    git \
    libsqlite3-dev \
    libxml2-dev \
    pkg-config \
    re2c</code>
</pre>

### Baixe o Pacote da Versão

Você pode baixar o pacote diretamente:

<pre>
<code class="bash">curl https://downloads.php.net/~derick/php-7.4.0RC6.tar.gz \
    -o php-7.4.0RC6.tar.gz</code>
</pre>

### Verifique a Integridade do Pacote

Se quiser verificar a integridade do pacote você pode baixar as chaves GPG dos
mantenedores dos pacotes do PHP [nesta página][gpg-keys]:

<pre>
<code class="bash">curl https://www.php.net/distributions/php-keyring.gpg \
    -o php-keyring.gpg</code>
</pre>

Para importar as chaves, execute:

<pre>
<code class="bash">gpg --import php-keyring.gpg</code>
</pre>

Baixe também o arquivo ASC, usado para checar a integridade do pacote: 

<pre>
<code class="bash">curl https://downloads.php.net/~derick/php-7.4.0RC6.tar.gz.asc \
    -o php-7.4.0RC6.tar.gz.asc</code>
</pre>

E finalmente, para verificar a integridade do pacote:

<pre>
<code class="bash">gpg --verify php-7.4.0RC6.tar.gz.asc php-7.4.0RC6.tar.gz</code>
</pre>

### Extraia o Pacote

Extraia o conteúdo do pacote:

<pre>
<code class="bash">tar -zxvf php-7.4.0RC6.tar.gz</code>
</pre>

### Configure o Pacote

Acesse a pasta criada:

<pre>
<code class="bash">cd php-7.4.0RC6</code>
</pre>

Para configurar o pacote com as opções básicas de desenvolvimento:

<pre>
<code class="bash">./configure \
    --enable-maintainer-zts \
    --enable-debug \
    --enable-cli</code>
</pre>

Se quiser conhecer as muitas opções de configuração disponíveis:

<pre>
<code class="bash">./configure --help</code>
</pre>

### Compile o Pacote 

Para compilar o pacote, execute:

<pre>
<code class="bash">make</code>
</pre>

Se quiser compilar (muito) mais rápido:

<pre>
<code class="bash">make -j$(nproc)</code>
</pre>

### Teste o Pacote

Verifique a versão do CLI do PHP que foi gerado:

<pre>
<code class="bash">sapi/cli/php --version</code>
</pre>

E quais módulos foram instalados:

<pre>
<code class="bash">sapi/cli/php -m</code>
</pre>

Para rodar os testes, execute:

<pre>
<code class="bash">make test</code>
</pre>

Se quiser usar mais unidades de processamento, execute:

<pre>
<code class="bash">make TEST_PHP_ARGS=-j$(nproc) test</code>
</pre>

Ao final dos testes, será apresentada uma opção para enviar um relatório com os
resultados para o time de qualidade do PHP:

<a href="{{ site.url }}/content/posts/pt-br/2019/11/compilando-o-php-a-partir-do-pacote/qa-report-prompt.png"
    data-fancybox data-caption="Resultado da execução dos testes">
    <img src="{{ site.url }}/content/posts/pt-br/2019/11/compilando-o-php-a-partir-do-pacote/thumb-qa-report-prompt.png"
        alt="Imagem do terminal mostrando o resultado da execução dos testes"
        title="Resultado da execução dos testes" />
</a>

Você pode confirmar (opção padrão) e informar seu e-mail em seguida, ou salvar
os resultados, caso queira enviar depois.

Por enquanto é isso. Bons testes e até a próxima!

[gpg-keys]: https://www.php.net/gpg-keys.php
[package-news]: https://www.php.net/archive/2019.php#2019-11-14-1
[sammy-post]: https://www.sammyk.me/compiling-php-from-source-writing-tests-for-php-source
