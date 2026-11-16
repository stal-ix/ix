{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
man-db
{% endblock %}

{% block version %}
2.13.2
{% endblock %}

{% block fetch %}
http://download.savannah.nongnu.org/releases/man-db/man-db-{{self.version().strip()}}.tar.xz
881df6b370b40cd73db8c543c02c94af5fc5a7c96189a7e2e9af12481f611d8b
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/gdbm
lib/kernel
lib/seccomp
lib/pipeline
# error
lib/shim/gnu
lib/bsd/overlay
{% endblock %}

{% block bld_tool %}
bin/groff
bld/gettext
{% endblock %}

{% block configure_flags %}
--disable-setuid
--with-systemdtmpfilesdir=${out}/tmp
--with-systemdsystemunitdir=${out}/share
{% endblock %}

{% block install %}
{{super()}}
rm -rf ${out}/tmp
{% endblock %}
