db_server_software:
    pkg.installed:
        - name: mysql-server

db_server_config:
    file.managed:
        - name: /etc/mysql/my.cnf
        - source: salt://files/etc/mysql/my.cnf
        - user: root
        - group: root

db_server_user:
    mysql_user.present:
        - name: salt
        - host: app%
        - password: "s4ltm4$t3r!"

db_server_database:
    mysql_database.present:
        - name: salt

db_server_grants:
    mysql_grants.present:
        - grant: all privileges
        - database: salt.*
        - host: app%
        - user: salt

db_server_service:
    service.running:
        - name: mysql
        - enable: True
        - restart: True
        - watch:
            - pkg: mysql-server
            - file: db_server_config
        - require:
            - file: db_server_config
