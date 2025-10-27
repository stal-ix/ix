{% extends '//lib/cap/t/ix.sh' %}

{% block pkg_name %}
libcap
{% endblock %}

{% block version %}
2.77
{% endblock %}

{% block fetch %}
https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-{{self.version().strip()}}.tar.gz
f07fcec6f01edc4bb18373067494fdcb718186aed720b97ec6c7a5d67b218f69
{% endblock %}

{% block host_libs %}
{{super()}}
lib/c
{% endblock %}

{% block unpack %}
{{super()}}
cd libcap
{% endblock %}

{% block make_flags %}
{{super()}}
BUILD_CC=${HOST_CC}
{% endblock %}
