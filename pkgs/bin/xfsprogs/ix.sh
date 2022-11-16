{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/xfsprogs-6.0.0.tar.xz
sha:b77cec2364aab0b8ae8d8c67daac7fdb3801e0979f1d8328d9c3469e57ca9ca0
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
