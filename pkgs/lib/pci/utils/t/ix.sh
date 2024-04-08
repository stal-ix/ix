{% extends '//die/c/make.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/software/utils/pciutils/pciutils-3.12.0.tar.xz
sha:f185d116d5ff99b797497efce8f19f1ee8ccc5a668b97a159e3d13472f674154
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
