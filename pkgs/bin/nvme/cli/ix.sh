{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
nvme-cli
{% endblock %}

{% block version %}
2.14
{% endblock %}

{% block fetch %}
https://github.com/linux-nvme/nvme-cli/archive/refs/tags/v{{self.version().strip()}}.tar.gz
ff689ec0dabd32e8077a9fc0b2732067b08dedeef471aadea0136ae210f6edd1
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
