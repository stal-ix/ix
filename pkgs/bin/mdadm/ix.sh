{% extends '//die/c/make.sh' %}

{% block pkg_name %}
mdadm
{% endblock %}

{% block version %}
4.4
{% endblock %}

{% block fetch %}
https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/snapshot/mdadm-{{self.version().strip()}}.tar.gz
680fed532857088e0cd87c56c00033ae35eae0a3f9cb7e1523b345ba8717fb93
{% endblock %}

{% block bld_libs %}
lib/c
lib/udev
lib/kernel
lib/shim/gnu/basename/overlay
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block cpp_defines %}
NAME_MAX=255
FALLOC_FL_ZERO_RANGE=0
_GNU_SOURCE
{% endblock %}

{% block make_flags %}
INSTALL=install
BINDIR=${out}/bin
MANDIR=${out}/share/man
CHECK_RUN_DIR=0
RUN_DIR=/var/run/mdadm
LIBDIR=${out}/bin/bin_mdadm
SYSTEMD_DIR=${out}/share/systemd
UDEVDIR=${out}/share/udev
{% endblock %}
