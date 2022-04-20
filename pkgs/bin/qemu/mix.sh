{% extends '//mix/make.sh' %}

{% block fetch %}
https://download.qemu.org/qemu-7.0.0.tar.xz
sha:f6b375c7951f728402798b0baabb2d86478ca53d44cedbefabbe1c46bf46f839
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/linux
lib/pixman
{% endblock %}

{% block bld_tool %}
bld/perl
bin/bzip2
bld/ninja
bld/python
bin/elfutils
bld/pkg/config
{% endblock %}

{% block configure %}
sh ./configure \
    --prefix=${out} \
    --static \
    --target-list="x86_64-softmmu"
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|-lstdc++|-lc|' -i "${l}"
done
{% endblock %}

{% block c_rename_symbol %}
buffer_init
{% endblock %}
