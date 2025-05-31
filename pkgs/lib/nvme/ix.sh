{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libnvme
{% endblock %}

{% block version %}
1.14
{% endblock %}

{% block fetch %}
https://github.com/linux-nvme/libnvme/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:a7230d6d4959f26cf0c0ef6c9bb479bd94a8c0ec738bf6e164d66c3dc6397e66
{% endblock %}

{% block lib_deps %}
lib/c
lib/dbus
lib/uring
lib/json/c
lib/openssl
lib/key/utils
lib/linux/util
{% endblock %}

{% block bld_tool %}
bld/bash
{% endblock %}

{% block cpp_defines %}
SCOPE_DELIMITER=\\'%\\'
{% endblock %}
