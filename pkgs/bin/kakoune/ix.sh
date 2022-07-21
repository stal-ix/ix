{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/mawww/kakoune/archive/refs/tags/v2021.11.08.tar.gz
sha:0885dc65377057fcfea0e7053d01d95a83668ec1907aced84dface8e00b83dee
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block bld_tool %}
bin/gzip
{% endblock %}
