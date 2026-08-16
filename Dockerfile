FROM nginx:alpine

# Remove qualquer configuração padrão anterior
RUN rm -rf /etc/nginx/conf.d/default.conf

# Cria um arquivo de configuração limpo e direto
RUN echo 'server { \
    listen 80; \
    location / { \
        root /usr/share/nginx/html; \
        index index.html index.htm; \
        try_files $uri $uri/ /index.html; \
    } \
}' > /etc/nginx/conf.d/default.conf

# Garante que a pasta existe e cria um index.html de teste funcional
RUN mkdir -p /usr/share/nginx/html && \
    echo '<h1 style="text-align:center; margin-top:20vh; font-family:Arial;">Site IAutomacao No Ar!</h1>' > /usr/share/nginx/html/index.html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
