# Proposta comercial estática — nginx alpine
FROM nginx:alpine

# limpa o conteúdo padrão do nginx
RUN rm -rf /usr/share/nginx/html/*

# configuração e conteúdo
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY site/ /usr/share/nginx/html/

EXPOSE 80
