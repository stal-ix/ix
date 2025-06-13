{% extends '//die/c/make.sh' %}

{% block pkg_name %}
libtraceevent
{% endblock %}

{% block version %}
1.8.4
{% endblock %}

{% block fetch %}
https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/snapshot/libtraceevent-{{self.version().strip()}}.tar.gz
dc456d4d2bf4b4cd4d0c737d3374a8093f9e5ca18c1d7fc2279a4bf41e613121
{% endblock %}

{% block lib_deps %}
lib/c
lib/dlfcn
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/pkg/config
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
