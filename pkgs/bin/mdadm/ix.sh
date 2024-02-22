{% extends '//die/c/make.sh' %}

{% block fetch %}
https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/snapshot/mdadm-4.3.tar.gz
sha:1a38a5eed3738c130ead8fa5bea7d0ceec4676132c8c69536f176b9951b27b0b
{% endblock %}

{% block bld_libs %}
lib/c
lib/udev
lib/kernel
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
