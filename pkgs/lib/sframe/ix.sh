{% extends '//die/c/autohell.sh' %}

{% include '//bin/binutils/t/ver.sh' %}

{% block unpack %}
{{super()}}
cd libsframe
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_flags %}
--enable-targets=all
--enable-install-libbfd
{% endblock %}
