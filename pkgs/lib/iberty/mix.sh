{% extends '//mix/autohell.sh' %}

{% block fetch %}
{% include '//bin/binutils/ver.sh' %}
{% endblock %}

{% block unpack %}
{{super()}}
cd libiberty
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block make_flags %}
MULTIOSDIR=
target_header_dir=${out}/include
{% endblock %}

{% block install %}
{{super()}}
# nu ego nah
rm ${out}/include/sort.h
{% endblock %}
