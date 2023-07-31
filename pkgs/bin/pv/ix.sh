{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/a-j-wood/pv/releases/download/v1.7.24/pv-1.7.24.tar.gz
sha:3bf43c5809c8d50066eaeaea5a115f6503c57a38c151975b710aa2bee857b65e
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
