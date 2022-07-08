{% extends '//die/autohell.sh' %}

{% block fetch %}
https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/xfsprogs-5.18.0.tar.xz
sha:1e8d8801bdec8cd4cad360ce3bbd12c35a97f2bc8f7c8c9580d1903b0e8cc35b
{% endblock %}

{% block bld_libs %}
lib/c
lib/edit
lib/inih
lib/urcu
lib/linux
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
