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
