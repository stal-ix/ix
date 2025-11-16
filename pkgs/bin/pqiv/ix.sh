{% extends '//die/c/make.sh' %}

{% block pkg_name %}
pqiv
{% endblock %}

{% block version %}
2.13.3
{% endblock %}

{% block fetch %}
https://github.com/phillipberndt/pqiv/archive/refs/tags/{{self.version().strip()}}.tar.gz
f0ffaa33e93299b38058c507da2945976a4b350c92cf1c4b3649586444395dfd
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
