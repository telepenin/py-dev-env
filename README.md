Provision examples
==================

## Virtualenv and PIP

```bash
$ vagrant up virtualenv
$ vagrant ssh virtualenv
(vagrant)$ workon todo-django
(vagrant)(todo-django)$ cd /vagrant/todomvc-django-backbone/todomvc-django/
(vagrant)(todo-django)$ ./manage.py runserver 0.0.0.0:8000
```

## Buildout
```bash
$ vagrant up buildout
$ vagrant ssh buildout
(vagrant)$ cd /vagrant/buildout_example
(vagrant)$ bin/django-manage runserver 0.0.0.0:8000
```

## Ansible

```bash
$ vagrant up ansible
$ vagrant ssh ansible
(vagrant)$ cd /vagrant/todomvc-django-backbone
(vagrant)$ bin/django-manage runserver 0.0.0.0:8000
```

## Docker 

```bash
$ vagrant up docker
$ vagrant ssh docker
(vagrant)$ cd /vagrant/todomvc-django-backbone/todomvc-backbone

# Create frontend image
(vagrant)$ docker build -t prefer/frontend .

# Get js dependencies
(vagrant)$ docker run --privileged=true --rm \
    -v $(pwd):/data prefer/frontend \
    cp -a /tmp/bower_components /data/bower_components

# Create backend image
(vagrant)$ cd /vagrant/todomvc-django-backbone/todomvc-django
(vagrant)$ docker build -t prefer/backend .

# Run migration
(vagrant)$ docker run --rm -v $(pwd):/data/back prefer/backend \
    ./manage.py migrate --run-syncd

# Run the server
(vagrant)$ cd /vagrant/todomvc-django-backbone/
(vagrant)$ docker run -d -p "8000:8000" --name todomvc-backend \
    -v $(pwd)/todomvc-django:/data/back \
    -v $(pwd)/todomvc-backbone:/data/todomvc-backbone \ 
    prefer/backend ./manage.py runserver 0.0.0.0:8000

```
