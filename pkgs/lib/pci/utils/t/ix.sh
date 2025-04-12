{% extends '//die/c/make.sh' %}

{% block pkg_name %}
pciutils
{% endblock %}

{% block version %}
3.13.0
{% endblock %}

{% block fetch %}
https://github.com/pciutils/pciutils/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:861fc26151a4596f5c3cb6f97d6c75c675051fa014959e26fb871c8c932ebc67
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block make_flags %}
# TODO(pg): proper data dir
SHAREDIR="${out}/share/hwdata"
SBINDIR="${out}/bin"
SHARED=no
{% endblock %}

{% block cpp_missing %}
libgen.h
{% endblock %}
