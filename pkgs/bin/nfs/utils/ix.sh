{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
nfs-utils
{% endblock %}

{% block version %}
2.8.3
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/nfs/nfs-utils/{{self.version().strip()}}/nfs-utils-{{self.version().strip()}}.tar.xz
sha:7251a867f6be8c681bc92e4671c983be09c06a053e514c4b486de36fb8221f65
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
lib/shim/gnu/basename/overlay
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
