{% extends '//die/c/make.sh' %}

{% block fetch %}
https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/snapshot/libtraceevent-1.7.3.tar.gz
sha:097b72e0d907f3107825fb2edf0188324bf70dc9da360f6efa68dc484ffde541
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
