{% extends '//die/c/make.sh' %}

{% block fetch %}
https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/snapshot/libtraceevent-1.7.2.tar.gz
sha:a8b4bf8f05c06d1d6405f6d0038467a87e7ab218f0d8b0608d08bca5d1fc112a
{% endblock %}

{% block lib_deps %}
lib/c
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
