{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
nvme-cli
{% endblock %}

{% block version %}
2.16
{% endblock %}

{% block fetch %}
https://github.com/linux-nvme/nvme-cli/archive/refs/tags/v{{self.version().strip()}}.tar.gz
989682ed7b250a2c7a8127e362ffc5d29f5c370127abe405be09c73216da2b97
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
