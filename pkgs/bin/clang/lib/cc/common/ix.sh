{% extends '//die/py.py' %}

{% block env %}
export CC=clang
export CXX=clang++
export OBJC=clang
{% endblock %}
