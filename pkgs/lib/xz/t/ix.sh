{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/tukaani-project/xz/releases/download/v5.6.2/xz-5.6.2.tar.gz
sha:8bfd20c0e1d86f0402f2497cfa71c6ab62d4cd35fd704276e3140bfb71414519
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block std_box %}
{% if mingw32 %}
bin/slibtool
{% endif %}
{{super()}}
{% endblock %}

{% block configure_flags %}
{% if wasi %}
--enable-threads=no
{% endif %}
{% endblock %}
