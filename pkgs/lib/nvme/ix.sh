{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/linux-nvme/libnvme/archive/refs/tags/v1.4.tar.gz
sha:19a982e6b38fd0de9c4ed72196d69606f5829f8fab3793393468e2dc27b3bb96
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
