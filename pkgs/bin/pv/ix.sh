{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.ivarch.com/programs/sources/pv-1.8.5.tar.gz
sha:d22948d06be06a5be37336318de540a2215be10ab0163f8cd23a20149647b780
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block cpp_defines %}
{% if darwin %}
stat64=stat
fstat64=fstat
lstat64=lstat
{% endif %}
{% endblock %}
