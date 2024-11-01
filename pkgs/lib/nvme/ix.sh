{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/linux-nvme/libnvme/archive/refs/tags/v1.11.tar.gz
sha:f6da60036b14e0427246718a32abff442228331f9ae3853f89160cf366d83dfe
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
