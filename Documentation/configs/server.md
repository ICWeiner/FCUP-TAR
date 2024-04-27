Add this to /etc/nginx/conf.d/server1.conf

```
server {
    listen 80;
    listen 8080 ;

    root /home/diogo/public_html/template;

}
```

Add this to /etc/nginx/sites-available/tar-cdn

```
server {
       listen 80;
       listen [::]:80;

       server_name tar-cdn.cloud;

       root /home/diogo/public_html/template;
       index index.html;

       location / {
               try_files $uri $uri/ =404;
       }
}
```

Add site's content to /home/diogo/public_html/template

