{% extends '//die/c/make.sh' %}

{% block pkg_name %}
libpfm
{% endblock %}

{% block version %}
4.14.1
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/perfmon2/libpfm4/libpfm-{{self.version().strip()}}.tar.gz
af518eab2114b0e11dfeacf8dd618b0a1ea04f28cd0b38acad2ec99abff2fd04
{% endblock %}

{% block unpack %}
{{super()}}
cd lib
{% endblock %}

{% block make_flags %}
SYS=Linux
ARCH={{target.arch}}
CONFIG_PFMLIB_SHARED=n
{% endblock %}

{% block lib_deps %}
lib/c
lib/kernel
{% endblock %}

{% block build_flags %}
no_werror
{% endblock %}

{% block install %}
{{super()}}
cp -R ../include ${out}/
{% endblock %}
