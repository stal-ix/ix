{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/tukaani-project/xz/releases/download/v5.8.0/xz-5.8.0.tar.gz
sha:b523c5e47d1490338c5121bdf2a6ecca2bcf0dce05a83ad40a830029cbe6679b
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
