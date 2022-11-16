{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
http://download.savannah.nongnu.org/releases/man-db/man-db-2.11.1.tar.xz
sha:2eabaa5251349847de9c9e43c634d986cbcc6f87642d1d9cb8608ec18487b6cc
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
