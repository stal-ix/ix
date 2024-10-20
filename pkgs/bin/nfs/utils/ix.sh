{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/nfs/nfs-utils/2.8.1/nfs-utils-2.8.1.tar.xz
sha:794583651702c0cbe12a66b16bef4f100d6661bcff94206d7a5a404bd16d75ab
{% endblock %}

{% block bld_libs %}
lib/c
lib/nl
lib/event
lib/tirpc
lib/xml/2
lib/kernel
lib/sqlite/3
lib/readline
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
