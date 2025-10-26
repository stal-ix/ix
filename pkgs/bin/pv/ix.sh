{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
pv
{% endblock %}

{% block version %}
1.9.44
{% endblock %}

{% block fetch %}
https://www.ivarch.com/programs/sources/pv-{{self.version().strip()}}.tar.gz
e130c9e18b1e6e9e2ef95bec6117c72cb9be27a1b8ffe97fca787e4c8e014562
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
