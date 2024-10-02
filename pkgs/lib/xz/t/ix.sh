{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/tukaani-project/xz/releases/download/v5.6.3/xz-5.6.3.tar.gz
sha:b1d45295d3f71f25a4c9101bd7c8d16cb56348bbef3bbc738da0351e17c73317
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
