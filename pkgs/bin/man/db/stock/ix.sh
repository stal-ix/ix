{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
http://download.savannah.nongnu.org/releases/man-db/man-db-2.12.0.tar.xz
sha:415a6284a22764ad22ff0f66710d853be7790dd451cd71436e3d25c74d996a95
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/gdbm
lib/kernel
lib/seccomp
lib/pipeline
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
