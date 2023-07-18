{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/a-j-wood/pv/releases/download/v1.7.0/pv-1.7.0.tar.gz
sha:76fe3985215e87a44f2abf2b9a37702ede6b04a07ca5a5c189be16d5b6cbf439
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
