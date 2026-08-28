{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libnvme
{% endblock %}

{% block version %}
1.16.2
{% endblock %}

{% block fetch %}
https://github.com/linux-nvme/libnvme/archive/refs/tags/v{{self.version().strip()}}.tar.gz
1d850d5a871559abf641d6e6b63bb86047e4cb26f3ad144597c2c64b3cff7231
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
