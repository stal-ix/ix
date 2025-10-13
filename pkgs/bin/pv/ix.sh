{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
pv
{% endblock %}

{% block version %}
1.9.42
{% endblock %}

{% block fetch %}
https://www.ivarch.com/programs/sources/pv-{{self.version().strip()}}.tar.gz
fbd7d1b04efee62c8241255a3fe1c5f5236f1a6e1ed85f02730b0c6448810175
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
