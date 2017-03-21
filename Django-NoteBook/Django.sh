1. Set Django environment

* Install Python in Ubuntu
  
  apt-get install python3.4

2. Set virtualenv
  * apt-get install python-virtualenv
  * virtualenv --python=python3.4 myenv(your virtualenv name, which you want)
  
  After that, you will find the myenv folder under current folder. So 'source myenv/bin/active', you will come into your virtual environment.At this condition, you could continue to run the next step for Django install.
  * (myenv)~$ pip install django==1.8
  For this step, if you encounter problem in Ubuntu 12.04, maybe the below command will help you.
  * pip python -m 
  * pip install -U --force-reinstall pip

After all the above step, you will get the Django environment. And the next step, you maybe want to create Django project for test. So go on.
* django-admin startproject mysite .
  The above command also intead of 'django-admin.py startproject mysite .'.
  Note: when you run the above command, please make sure you are under the virtualenv condition.
  Your project structure as the below showed:
  current folder
  |
  |----manage.py
  |
  |----mysite
         setting.py
	 urls.py
	 wsgi.py
	 __init__.py

  * manage.py
    This shell file help you manage your website. And it will help you start a local web server, which don\'t need you install any file.
  * setting.py
    This shell file includes the data for your website.
  * urls.py
    This shell file covers the all urlresolver model list.

* DATABASE
  create a new database for your project(mysite):
  * python manage.py migrate

* Start Server
  how to start the web server:
  * python manage.py runserver
  If you encounter the error in WinOS, maybe you could run the below command for replacing.  * python manage.py runserver 0:8000

  After running the command for starting server, you will get the website in your terminal. Copying it and pasting it in your broswer.
 
* create appliance program in our project-mysite.
  * python manage.py startapp blog
  At this step, if you server is running. You will fail to create this blog app. So please close your server.

  After created Blog app, you should add this app to 'mysite/settings.py'
  * INSTALL_APPS = (
        'django.contrib.admin',
	'django.contrib.auth',
	... ,
	'blog',
    )

* create data model for your new created app(blog)
  * python manage.py makemigrations blog
  And then database will provide the migration files, so you should run the below command:
    * python manage.py migrate blog

* changed the admin.py file, to register the Post model
  * from .models import Post
  * admin.site.register(Post)

After the all steps, you could to start the web server, used the below command:
  * python manage.py runserver
And then to visit the localhost:8000/admin page.

* create super user for you admin page management
  * python manage.py createsuperuser

  For testing, you could use post function to add some issue for you server.

The next step to install Git
* Install git 
  * apt-get install git
  
  * create '.gitignore' file includes the ignore file for Git updates.

* git status command
  It will be show the all modified/cache/untracked file and the branch status.

* git init
* git config --global user.name "Your name"
* git config --global user.email you@email.com
* Edit .gitignore file(This file needs you to create)
  vim .gitignore
    - *.pyc
    - __pycache__
    - myenv
    - db.sqlite3
    - .DS_Store
  Input the list file to .gitignore file.
* git status
  This command will help you check the current status of the whole project.
* git add --all .
  This commmand will help you add all files under the current folder to git.
* git commit -m "This message like comments for your project"
  Commit to the local store.
* git remote add origin SSH or HTTPS(This is your remote website in github.com)

* git push -u origin master
  push your local store to the remote depot in github.com

After pushed your code to github.com, you will get your code at any where you want. At another OS, how to get the source code and run the server as your local environment. You can do it as follow:
* git clone HTTPS or SSH (your github.com repo sites)
  * tree your project folder-name
* cd your project folder-name

* virtualenv --python=python3.4 myenv

* source myenv/bin/activate

* pip install django whitnoise

* python manage.py collectstatic

* python manage.py migrate  (initalize your database)

* python manage.py createsuperuser

* python manage.py runserver (IP:PORT)
  The brackets content if you need you can input it, if not, keep clean.

