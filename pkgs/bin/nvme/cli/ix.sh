{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
nvme-cli
{% endblock %}

{% block version %}
3.2
{% endblock %}

{% block fetch %}
https://github.com/linux-nvme/nvme-cli/archive/refs/tags/v{{self.version().strip()}}.tar.gz
8ad36c9fe68a01e73e0dd542afdc38cc51309ed185fa9b80e4b0a8c61831a235
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

{% block install %}
{{super()}}
cd ${out}
mv sbin bin
{% endblock %}
