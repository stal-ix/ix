{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/xfsprogs-6.1.1.tar.xz
sha:05e8a137870db1d6182df72dda98ab7a7100deb376947e854b9d59c914c2c7bb
{% endblock %}

{% block bld_libs %}
lib/c
lib/edit
lib/inih
lib/urcu
lib/kernel
lib/e2fsprogs
{% endblock %}

{% block bld_tool %}
bld/bash
bld/gettext
{% endblock %}

{% block configure_flags %}
--enable-editline=yes
--enable-blkid=no
{% endblock %}

{% block patch %}
sed -e 's|/bin/bash|/usr/bin/env bash|' -i install-sh
{% endblock %}

{% block install %}
{{super()}}
rm -rf ${out}/lib64
{% endblock %}
