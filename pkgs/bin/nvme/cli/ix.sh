{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/linux-nvme/nvme-cli/archive/refs/tags/v2.10.2.tar.gz
sha:b3c256959ff34124788aa96c8602c9cef00705d01cc3cb9322bf3269e00ae904
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
