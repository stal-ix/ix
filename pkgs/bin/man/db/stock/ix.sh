{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
man-db
{% endblock %}

{% block version %}
2.13.1
{% endblock %}

{% block fetch %}
http://download.savannah.nongnu.org/releases/man-db/man-db-{{self.version().strip()}}.tar.xz
sha:8afebb6f7eb6bb8542929458841f5c7e6f240e30c86358c1fbcefbea076c87d9
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
