{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/hufrea/byedpi/archive/refs/tags/v0.14.1.tar.gz
sha:0673ca30d0553709fee2c3a982c3b7168ac5a94d831358fba9e489b27d82261a
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}
