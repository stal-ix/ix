{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/tukaani-project/xz/releases/download/v5.6.1/xz-5.6.1.tar.gz
sha:2398f4a8e53345325f44bdd9f0cc7401bd9025d736c6d43b372f4dea77bf75b8
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
