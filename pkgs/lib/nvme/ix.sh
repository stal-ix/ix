{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/linux-nvme/libnvme/archive/refs/tags/v1.12.tar.gz
sha:53791f2e75773ba95449fc98a3b8b444d984624322ec6980049fd4eb289123d5
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
