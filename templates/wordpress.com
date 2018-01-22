server {
    listen {{ LISTEN_NGINX_PORT }} ;
    server_name {{ NGINX_SERVER_NAME }};
    location / {
             proxy_pass http://{{ ansible_default_ipv4.address }}:{{ WP_HOST_PORT }};
    }
}