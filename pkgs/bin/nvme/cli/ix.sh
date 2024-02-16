{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/linux-nvme/nvme-cli/archive/refs/tags/v2.8.tar.gz
sha:0743d9188792a87d39187ae5e5cb31e8f46cca8c6f100547c50ec0dd659d2531
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
