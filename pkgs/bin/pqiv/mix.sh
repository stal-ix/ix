{% extends '//die/make.sh' %}

{% block fetch %}
https://github.com/phillipberndt/pqiv/archive/refs/tags/2.12.tar.gz
sha:1538128c88a70bbad2b83fbde327d83e4df9512a2fb560eaf5eaf1d8df99dbe5
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
