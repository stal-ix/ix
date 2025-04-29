{% extends '//die/c/autohell.sh' %}

{% include '//bin/binutils/t/ver.sh' %}

{% block unpack %}
{{super()}}
cd libiberty
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block make_flags %}
MULTIOSDIR=
target_header_dir=${out}/include/libiberty
{% endblock %}
