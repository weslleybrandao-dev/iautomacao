FROM nginx:alpine

# Remove a configuração padrão
RUN rm -rf /etc/nginx/conf.d/default.conf

# Copia a nossa configuração do Nginx
COPY nginx.conf /etc/nginx/conf.d/

# Copia todos os arquivos do site diretamente para a raiz do Nginx
COPY . /usr/share/nginx/html/

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
