{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/linux-nvme/libnvme/archive/refs/tags/v1.1.tar.gz
sha:d000181356513733671409c747c88826155b60f45f76e7289d6bbf27a8f851b0
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
