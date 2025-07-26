{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libnvme
{% endblock %}

{% block version %}
1.15
{% endblock %}

{% block fetch %}
https://github.com/linux-nvme/libnvme/archive/refs/tags/v{{self.version().strip()}}.tar.gz
c21cd9379390bdc52c9d9569a241274f8115fc247b76a5d922d639f48c8174a2
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
