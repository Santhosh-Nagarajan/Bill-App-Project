FROM ubuntu

WORKDIR /app

RUN apt update


RUN  apt install -y nginx

#RUN adduser -g 'Nginx www user' -h /home/www/ nginx

RUN rm -r /etc/nginx/nginx.conf

COPY nginx.conf /etc/nginx/

EXPOSE 80

RUN service nginx stop

CMD ["nginx", "-g", "daemon off;"]
