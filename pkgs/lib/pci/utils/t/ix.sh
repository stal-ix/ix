{% extends '//die/c/make.sh' %}

{% block pkg_name %}
pciutils
{% endblock %}

{% block version %}
3.14.0
{% endblock %}

{% block fetch %}
https://github.com/pciutils/pciutils/archive/refs/tags/v{{self.version().strip()}}.tar.gz
9f99bb89876510435fbfc47bbc8653bc57e736a21915ec0404e0610460756cb8
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
