{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/Old-Man-Programmer/tree/archive/refs/tags/2.1.1.tar.gz
sha:1b70253994dca48a59d6ed99390132f4d55c486bf0658468f8520e7e63666a06
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
