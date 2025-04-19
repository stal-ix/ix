{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
man-db
{% endblock %}

{% block version %}
2.13.0
{% endblock %}

{% block fetch %}
http://download.savannah.nongnu.org/releases/man-db/man-db-{{self.version().strip()}}.tar.xz
sha:82f0739f4f61aab5eb937d234de3b014e777b5538a28cbd31433c45ae09aefb9
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
