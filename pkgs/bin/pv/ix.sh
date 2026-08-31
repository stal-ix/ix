{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
pv
{% endblock %}

{% block version %}
1.11.0
{% endblock %}

{% block fetch %}
https://www.ivarch.com/programs/sources/pv-{{self.version().strip()}}.tar.gz
fc02c9fc2b82b20a92cc8d98f844be63f22abd98751a8e4abc875e1d803662eb
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
