{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.ivarch.com/programs/sources/pv-1.8.9.tar.gz
sha:a0789d8f8c5a08faf370b5a07d1d936aeff9504a4f49da76d4164797ac4606e6
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
