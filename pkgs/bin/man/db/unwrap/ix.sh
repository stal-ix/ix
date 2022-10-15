{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
http://download.savannah.nongnu.org/releases/man-db/man-db-2.10.2.tar.xz
sha:ee97954d492a13731903c9d0727b9b01e5089edbd695f0cdb58d405a5af5514d
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/gdbm
lib/linux
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
