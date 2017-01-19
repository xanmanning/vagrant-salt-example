app_server_software:
    pkg.installed:
        - pkgs:
            - nginx
            - php5-fpm
            - php5-mysql

app_server_configuration:
    file.managed:
        - name: /etc/nginx/sites-enabled/app.salt.local.conf
        - source: salt://files/etc/nginx/sites-enabled/app.salt.local.conf
        - user: root
        - group: root
        - mode: 664
        - require:
            - pkg: app_server_software

app_server_remove_default:
    file.absent:
        - name: /etc/nginx/sites-enabled/default

app_server_service:
    service.running:
        - name: nginx
        - enable: True
        - reload: True
        - watch:
            - pkg: app_server_software
            - file: /etc/nginx/sites-enabled/app.salt.local.conf
        - require:
            - file: app_server_configuration

app_server_php_service:
    service.running:
        - name: php5-fpm
        - enable: True
        - reload: True
        - watch:
            - pkg: app_server_software
        - require:
            - file: app_server_configuration
