{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/linux-nvme/nvme-cli/archive/refs/tags/v2.2.1.tar.gz
sha:68720bc25c68adb93dafe1186de4fabbe40f8390ff1416256b52fe74f78259ae
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
