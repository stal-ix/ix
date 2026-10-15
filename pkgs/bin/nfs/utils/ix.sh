{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
nfs-utils
{% endblock %}

{% block version %}
3.1.1
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/nfs/nfs-utils/{{self.version().strip()}}/nfs-utils-{{self.version().strip()}}.tar.xz
945babebedf62f2ef426ea9bd82e7c6631022e5648cc9a4ef8db9ab49b692573
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
cat - support/nfs/getport.c << EOF > _
#include <stddef.h>
EOF
mv _ support/nfs/getport.c
for l in support/reexport/*.c; do
    cat - ${l} << EOF > _
#include <unistd.h>
EOF
    mv _ ${l}
done
{% endblock %}
