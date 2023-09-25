{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.ivarch.com/programs/sources/pv-1.8.0.tar.gz
sha:5cec4f737826a0eddab471dd3b75a587bd29a2e7cfa30068d57f29439a251fdf
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
