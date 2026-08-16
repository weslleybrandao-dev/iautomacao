FROM nginx:alpine

# Remove a configuração padrão do Nginx
RUN rm -rf /etc/nginx/conf.d/default.conf

# Copia o nosso arquivo de configuração personalizado
COPY nginx.conf /etc/nginx/conf.d/

# Copia os arquivos do site para a pasta padrão do Nginx
COPY . /usr/share/nginx/html/

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
