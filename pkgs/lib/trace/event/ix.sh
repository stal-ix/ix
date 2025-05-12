{% extends '//die/c/make.sh' %}

{% block pkg_name %}
libtraceevent
{% endblock %}

{% block version %}
1.8.3
{% endblock %}

{% block fetch %}
https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/snapshot/libtraceevent-{{self.version().strip()}}.tar.gz
sha:233d88adf5bae6b4511980f0f6314f348326b55fdb3dc9c4212c810e1ab06789
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
