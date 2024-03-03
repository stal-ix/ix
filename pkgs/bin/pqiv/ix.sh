{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/phillipberndt/pqiv/archive/refs/tags/2.13.tar.gz
sha:5dfe9272460edcc50e512dd3fec5eae6e2344dccd35ef6ee95fb747458dd5e9d
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/gtk/3
lib/image/magick
{% endblock %}

{% block bld_tool %}
bld/bash
bld/pkg/config
{% endblock %}

{% block configure %}
bash ./configure --prefix=${out}
{% endblock %}
