{% extends '//die/c/make.sh' %}

{% block pkg_name %}
libtraceevent
{% endblock %}

{% block version %}
1.9.1
{% endblock %}

{% block fetch %}
https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/snapshot/libtraceevent-{{self.version().strip()}}.tar.gz
3bc19dd940914260ba591b5276723bf84bb43f82c7c3d4267622bee4d016ea55
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
