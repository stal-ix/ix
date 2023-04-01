{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/linux-nvme/nvme-cli/archive/refs/tags/v2.4.tar.gz
sha:7f80102a933e3bf46f4f2089cad119c827a363478235f66b89ddaad9ca57d019
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
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv sbin bin
{% endblock %}
