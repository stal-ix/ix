{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/kuroko-lang/kuroko/archive/refs/tags/v1.3.1.tar.gz
sha:b1d1c55e72b01b08e88e0cdb9368788f2e3851abc918e29cae16fc442bee9c43
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
