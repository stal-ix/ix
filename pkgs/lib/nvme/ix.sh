{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/linux-nvme/libnvme/archive/refs/tags/v1.9.tar.gz
sha:455867060d2b7563eab59fe21779dff469d98465028997178c7efbe4b8763206
{% endblock %}

{% block lib_deps %}
lib/c
lib/dbus
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
