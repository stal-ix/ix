{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/tukaani-project/xz/releases/download/v5.4.6/xz-5.4.6.tar.gz
sha:aeba3e03bf8140ddedf62a0a367158340520f6b384f75ca6045ccc6c0d43fd5c
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
