{% extends '//die/c/meson.sh' %}

{% block version %}
2.13
{% endblock %}

{% block fetch %}
https://github.com/linux-nvme/nvme-cli/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:43797e5b146ef5d4a67120fcdf38bb8254dcafefa714467d3f08dd675ebd40bb
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
