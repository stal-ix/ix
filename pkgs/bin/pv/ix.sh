{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
pv
{% endblock %}

{% block version %}
1.12.0
{% endblock %}

{% block fetch %}
https://www.ivarch.com/programs/sources/pv-{{self.version().strip()}}.tar.gz
31fdbdb449c7143cd2968567bef7599e9f031950e6158ee7bb76e40aebf6ffb8
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
