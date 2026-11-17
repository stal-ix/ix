{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
man-db
{% endblock %}

{% block version %}
2.13.3
{% endblock %}

{% block fetch %}
http://download.savannah.nongnu.org/releases/man-db/man-db-{{self.version().strip()}}.tar.xz
7c10ac705433c740af91264fc29eee471090ead63a408541ab9736284a8c9deb
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
