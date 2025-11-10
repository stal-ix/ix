{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libnvme
{% endblock %}

{% block version %}
1.16.1
{% endblock %}

{% block fetch %}
https://github.com/linux-nvme/libnvme/archive/refs/tags/v{{self.version().strip()}}.tar.gz
ce1d9d393feb84c4e82ca096db2bdb7dd4a5fd1997d711cc1904796944f2c579
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
