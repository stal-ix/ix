{% extends '//die/inline/library.sh' %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block sources %}
sys_wait.h
sys_wait.c
{% endblock %}

{% block install %}
{{super()}}
mkdir ${out}/include/sys
mv ${out}/include/sys_wait.h ${out}/include/sys/wait.h
{% endblock %}
