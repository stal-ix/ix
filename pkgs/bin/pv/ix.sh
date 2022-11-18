{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://fossies.org/linux/privat/pv-1.6.20.tar.gz
sha:b5f1ee79a370c5287e092b6e8f1084f026521fe0aecf25c44b9460b870319a9e
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
