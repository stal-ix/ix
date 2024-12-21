{% extends '//die/c/make.sh' %}

{% block fetch %}
https://downloads.python.org/pypy/pypy3.10-v7.3.17-src.tar.bz2
sha:6ad74bc578e9c6d3a8a1c51503313058e3c58c35df86f7485453c4be6ab24bf7
{% endblock %}

{% block bld_tool %}
bld/python/2
{% endblock %}

{% block make_flags %}
RUNINTERP=python2
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
