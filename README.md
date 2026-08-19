# Proposta no Easypanel

Estrutura:

    Dockerfile
    nginx.conf
    site/
      proposta-fretes-x7k2/
        index.html   (as duas versões no mesmo arquivo, com alternador)

A proposta fica em `https://SEU-DOMINIO/proposta-fretes-x7k2/`.
Para abrir direto numa das versões, use a âncora:
`.../proposta-fretes-x7k2/#completa` ou `.../#validacao`.
A raiz do domínio devolve 404 de propósito — só quem tem o link chega ao documento.

## Passo a passo

1. Suba esta pasta para um repositório no GitHub (pode ser privado).
2. No Easypanel: **New → App**, dê um nome ao serviço.
3. Aba **Source**: escolha GitHub, aponte para o repositório e o branch.
   Se o repositório for privado, cadastre a chave SSH que o Easypanel mostra.
4. Aba **Build**: troque o método de Nixpacks para **Dockerfile**.
5. Aba **Domains**: adicione o domínio ou subdomínio e aponte a porta **80**.
   Deixe o SSL (Let's Encrypt) ligado.
6. No seu DNS, crie um registro A do subdomínio para o IP do servidor.
7. Clique em **Deploy**.

## Publicar uma nova versão

Substitua o `index.html` dentro de `site/proposta-fretes-x7k2/`, faça commit,
e clique em Deploy no Easypanel.

## Uma pasta por cliente

Para a próxima proposta, crie outra pasta com um nome imprevisível:

    site/proposta-nomedocliente-9m4t/index.html

Cada cliente recebe só o link dele, e um link não leva ao outro.

## Proteger com senha

    htpasswd -bc .htpasswd cliente SUA-SENHA

Adicione `COPY .htpasswd /etc/nginx/.htpasswd` ao Dockerfile e descomente as
duas linhas de `auth_basic` no `nginx.conf`.
