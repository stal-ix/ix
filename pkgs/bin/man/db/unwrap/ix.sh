{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
http://download.savannah.nongnu.org/releases/man-db/man-db-2.11.2.tar.xz
sha:cffa1ee4e974be78646c46508e6dd2f37e7c589aaab2938cc1064f058fef9f8d
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/gdbm
lib/kernel
lib/seccomp
lib/pipeline
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
