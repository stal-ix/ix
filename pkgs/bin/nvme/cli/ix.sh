{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
nvme-cli
{% endblock %}

{% block version %}
3.1
{% endblock %}

{% block fetch %}
https://github.com/linux-nvme/nvme-cli/archive/refs/tags/v{{self.version().strip()}}.tar.gz
8a6879f1f2af53743c03a8f77f247261306300d3f3b0edfd242c5f646bdfdccb
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
