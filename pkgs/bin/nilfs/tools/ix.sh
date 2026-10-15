{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
nilfs-utils
{% endblock %}

{% block version %}
2.2.11
{% endblock %}

{% block fetch %}
https://nilfs.sourceforge.io/download/nilfs-utils-{{self.version().strip()}}.tar.bz2
8602897ff0d2c49be9bc76311f0b102088e58b6de4f749009403de06ff2c34cd
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/linux/util
{% endblock %}

{% block configure_flags %}
--without-libmount
--without-selinux
{% endblock %}

{# mount.nilfs2, umount.nilfs2, mkfs.nilfs2 and nilfs_cleanerd are hardwired to
   /sbin, and nilfs_cleanerd.conf to /etc; both must land in the package #}
{% block make_flags %}
root_sbindir=${out}/sbin
sysconfdir=${out}/etc
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/sbin/* ${out}/bin/
rmdir ${out}/sbin
{% endblock %}
