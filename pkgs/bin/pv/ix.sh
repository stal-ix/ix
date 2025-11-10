{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
pv
{% endblock %}

{% block version %}
1.10.0
{% endblock %}

{% block fetch %}
https://www.ivarch.com/programs/sources/pv-{{self.version().strip()}}.tar.gz
998e717419c02ee735aea0b8d57f9cbe1112f40f4b947a39ba2611a415b64da0
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
