sqlbuddy_dir:
    file.directory:
        - name: /var/www
        - user: www-data
        - group: www-data

sqlbuddy_app:
    git.latest:
        - name: git://github.com/deliciousbrains/sqlbuddy.git
        - target: /var/www
        - user: www-data
        - branch: master
        - rev: master
        - force_reset: True
