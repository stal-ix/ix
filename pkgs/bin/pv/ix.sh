{% extends '//die/autohell.sh' %}

{% block fetch %}
http://www.ivarch.com/programs/sources/pv-1.6.6.tar.bz2
ff3564fddcc2b9bd4a9c1d143aba4b4c
{% endblock %}

{% block bld_tool %}
{% if darwin %}
bld/cctools
{% endif %}
{% endblock %}

{% block make_flags %}
{% if linux %}
LD=ld.lld
{% else %}
LD=ld
{% endif %}
{% endblock %}

{% block cpp_defines %}
{% if darwin %}
stat64=stat
fstat64=fstat
lstat64=lstat
{% endif %}
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
