{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/nfs/nfs-utils/2.6.4/nfs-utils-2.6.4.tar.xz
sha:0b52349312fecb6de1d379fe93cf78432f3653fb0f27c15368cbafb0b12d6642
{% endblock %}

{% block bld_libs %}
lib/c
lib/event
lib/tirpc
lib/kernel
lib/sqlite/3
lib/linux/util
lib/bsd/overlay
lib/rpcsvc/proto
lib/device/mapper
lib/shim/fake(lib_name=keyutils)
{% endblock %}

{% block bld_tool %}
bld/rpcgen
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block make_flags %}
udev_rulesdir=${out}/share/udev
{% endblock %}

{% block configure_flags %}
--disable-gss
--disable-sbin-override
--with-systemd=${out}/share/systemd
--with-statedir=${out}/var
--with-rpcgen=$(which rpcgen)
{% endblock %}

{% block patch %}
echo 'int main() {}' > utils/nfsidmap/nfsidmap.c
for l in support/reexport/*.c; do
    cat - ${l} << EOF > _
#include <unistd.h>
EOF
    mv _ ${l}
done
{% endblock %}
