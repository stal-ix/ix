{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/nfs/nfs-utils/2.6.3/nfs-utils-2.6.3.tar.xz
sha:6e12ede1611d3eeb89fa39ed37a1c15c667ad5076f171871ba3406c308a08e5a
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
udev_rulesdir=${out}/lib
{% endblock %}

{% block configure_flags %}
--disable-gss
--disable-sbin-override
--with-systemd=${out}/lib
--with-statedir=${out}/var
--with-rpcgen=$(which rpcgen)
{% endblock %}

{% block patch %}
echo 'int main() {}' > utils/nfsidmap/nfsidmap.c
{% endblock %}
