{% extends '//die/c/make.sh' %}

{% block pkg_name %}
libtraceevent
{% endblock %}

{% block version %}
1.8.5
{% endblock %}

{% block fetch %}
https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/snapshot/libtraceevent-{{self.version().strip()}}.tar.gz
1f2f5b8981818638ed51cdafc9b5e95316b5602255aa8ae19a3a5c8abede0e9a
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
