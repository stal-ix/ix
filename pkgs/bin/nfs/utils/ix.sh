{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
nfs-utils
{% endblock %}

{% block version %}
3.2.1
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/nfs/nfs-utils/{{self.version().strip()}}/nfs-utils-{{self.version().strip()}}.tar.xz
2c95bd1f5e9325cca6e39c41fbc0f2ae144a8be2073233efda261fe5002220c5
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
{% if x86_64 %}
{# lib/str (lib/c) has these in its one object #}
>support/nfs/strlcpy.c
>support/nfs/strlcat.c
{% endif %}
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
