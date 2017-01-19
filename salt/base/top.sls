base:
    '*':
        - defaults
        - editor
    'app*':
        - nginx
        - app
    'db*':
        - mysql
