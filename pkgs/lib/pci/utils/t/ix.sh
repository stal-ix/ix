{% extends '//die/c/make.sh' %}

{% block pkg_name %}
pciutils
{% endblock %}

{% block version %}
3.15.0
{% endblock %}

{% block fetch %}
https://github.com/pciutils/pciutils/archive/refs/tags/v{{self.version().strip()}}.tar.gz
06f467642057599acf396bc17340452fac3308f1e08be19e0c32587e42d7017b
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
