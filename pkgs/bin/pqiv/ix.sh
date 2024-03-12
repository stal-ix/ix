{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/phillipberndt/pqiv/archive/refs/tags/2.13.1.tar.gz
sha:1db8567f75884dfc5dd41208f309b11e4e4ca48ecad537915885b64aa03857a4
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
