git:
    pkg.installed:
        - name: git

/root/.bashrc:
    file.managed:
        - source: salt://files/etc/bashrc
        - user: root
        - group: root
        - mode: 644

/home/vagrant/.bashrc:
    file.managed:
        - source: salt://files/etc/bashrc
        - user: vagrant
        - group: vagrant
        - mode: 644

/root/.vimrc:
    file.managed:
        - source: salt://files/etc/vimrc
        - user: root
        - group: root
        - mode: 644

/home/vagrant/.vimrc:
    file.managed:
        - source: salt://files/etc/vimrc
        - user: vagrant
        - group: vagrant
        - mode: 644

master.salt.local:
    host.present:
        - ip: 10.10.8.2
        - names:
            - master
            - master.salt.local

app.salt.local:
    host.present:
        - ip: 10.10.8.3
        - names:
            - app
            - app.salt.local

db.salt.local:
    host.present:
        - ip: 10.10.8.4
        - names:
            - db
            - db.salt.local
