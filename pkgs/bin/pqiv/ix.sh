{% extends '//die/c/make.sh' %}

{% block version %}
2.13.2
{% endblock %}

{% block fetch %}
https://github.com/phillipberndt/pqiv/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:154cbbe0a62be12cee23b0a46a86b2305d8128fd19924308ad5e9d22fa5ad4f7
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
