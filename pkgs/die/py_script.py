{% extends 'script.json' %}

{% block script_body %}
import os
import sys
import atexit
import shutil

def prepare_dir(d):
    try:
        shutil.rmtree(d)
    except FileNotFoundError:
        pass

    os.makedirs(d)

def header():
    if out := os.environ.get('out'):
        prepare_dir(out)

    if tmp := os.environ.get('tmp'):
        prepare_dir(tmp)
        os.chdir(tmp)

def footer():
    if tmp := os.environ.get('tmp'):
        if sys.exc_info()[0]:
            shutil.rmtree(tmp)

header()
atexit.register(footer)

# suc
{% block py_script %}
{% endblock %}
# euc
{% endblock %}

{% block script_exec %}
runpy
{% endblock %}
