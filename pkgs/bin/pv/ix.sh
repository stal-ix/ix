{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.ivarch.com/programs/sources/pv-1.9.24.tar.gz
sha:1066ad83737cd2eb872b23c6a3c32f24c1af92c73deacb70cfb302001974a18a
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
