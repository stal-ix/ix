{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/linux-nvme/nvme-cli/archive/refs/tags/v2.11.tar.gz
sha:5e4dc73dbb488c6b1e6ad1c78d0c62b624076fcb0c052bd9039674a1dbd6517b
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/nvme
lib/json/c
lib/shim/gnu/basename/overlay
{% endblock %}

{% block bld_tool %}
bld/bash
{% endblock %}

{% block cpp_defines %}
u_int32_t=unsigned
__uint16_t=uint16_t
LC_MEASUREMENT=0
{% endblock %}

{% block patch %}
sed -e 's|= is_temp.*|= false;|' \
    -i nvme-print.c
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv sbin bin
{% endblock %}
