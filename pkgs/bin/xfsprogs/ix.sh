{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/xfsprogs-6.2.0.tar.xz
sha:d67dcba5a28e0904b60886b6e5f752bc7c9c3a5c7096153855b5adca9db86c51
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
bin/gzip
bld/bash
bld/gettext
{% endblock %}

{% block configure_flags %}
--enable-editline=yes
--enable-blkid=no
{% endblock %}

{% block make_flags %}
INSTALL=install
{% endblock %}

{% block patch %}
sed -e 's|/bin/bash|/usr/bin/env bash|' -i install-sh
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block install %}
{{super()}}
rm -rf ${out}/lib64
{% endblock %}
