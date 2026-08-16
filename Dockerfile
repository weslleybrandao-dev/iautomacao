FROM nginx:alpine

# Remove o arquivo de configuração padrão
RUN rm -rf /etc/nginx/conf.d/default.conf

# Cria a configuração do Nginx diretamente dentro do container de forma limpa
RUN echo -e 'server {\n\
    listen 80;\n\
    server_name localhost;\n\
    root /usr/share/nginx/html;\n\
    index index.html index.htm;\n\
    location / {\n\
        try_files $uri $uri/ =404;\n\
    }\n\
}' > /etc/nginx/conf.d/default.conf

# Copia os arquivos do site para a pasta web padrão
COPY . /usr/share/nginx/html/

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
