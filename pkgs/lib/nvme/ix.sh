{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/linux-nvme/libnvme/archive/refs/tags/v1.2.tar.gz
sha:2697c86e9d8597fcd264f8bf8af57a529346efa4f611ca2be855e3aa89b9eb2c
{% endblock %}

{% block lib_deps %}
lib/c
lib/json/c
lib/openssl
lib/linux/util
{% endblock %}

{% block bld_tool %}
bld/bash
{% endblock %}

{% block cpp_defines %}
SCOPE_DELIMITER=\\'%\\'
{% endblock %}
