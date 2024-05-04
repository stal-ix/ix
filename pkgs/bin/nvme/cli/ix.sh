{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/linux-nvme/nvme-cli/archive/refs/tags/v2.9.1.tar.gz
sha:4b61684a1d23de1d9d0abd3f273799c60256c0e2a2e68a790d7945183fe33874
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/nvme
lib/json/c
{% endblock %}

{% block bld_tool %}
bld/bash
{% endblock %}

{% block cpp_defines %}
u_int32_t=unsigned
__uint16_t=uint16_t
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv sbin bin
{% endblock %}
