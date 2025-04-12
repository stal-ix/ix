{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libnvme
{% endblock %}

{% block version %}
1.13
{% endblock %}

{% block fetch %}
https://github.com/linux-nvme/libnvme/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:f083c21f525644a2bcca6d367d96fab813de880cba9f1746a850f3a8692a5980
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
