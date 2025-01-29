{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.ivarch.com/programs/sources/pv-1.9.31.tar.gz
sha:a35e92ec4ac0e8f380e8e840088167ae01014bfa008a3a9d6506b848079daedf
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
