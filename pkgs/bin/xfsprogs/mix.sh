{% extends '//mix/autohell.sh' %}

{% block fetch %}
https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/xfsprogs-5.14.2.tar.xz
sha:01ccd3ef9df2837753a5d876b8da84ea957d13d7a461b8c46e8afa4eb09aabc8
{% endblock %}

{% block bld_libs %}
lib/c
lib/edit
lib/inih
lib/urcu
lib/linux
bin/e2fsprogs
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
cd ${out}; rm -rf lib64
{% endblock %}
