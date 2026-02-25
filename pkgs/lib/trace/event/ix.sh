{% extends '//die/c/make.sh' %}

{% block pkg_name %}
libtraceevent
{% endblock %}

{% block version %}
1.9.0
{% endblock %}

{% block fetch %}
https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/snapshot/libtraceevent-{{self.version().strip()}}.tar.gz
e6d82cb2392d04866203387fa092692e4282ccc36c8235dc129afd1ceba12684
{% endblock %}

{% block lib_deps %}
lib/c
lib/dlfcn
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/pkg/config
bld/fake/binutils
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block make_flags %}
libdir_relative_temp=lib
pkgconfig_dir=${out}/lib/pkgconfig
{% endblock %}

{% block make_install_target %}
install
install_pkgconfig
{% endblock %}
