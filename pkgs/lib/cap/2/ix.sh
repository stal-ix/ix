{% extends '//lib/cap/t/ix.sh' %}

{% block pkg_name %}
libcap
{% endblock %}

{% block version %}
2.76
{% endblock %}

{% block fetch %}
https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-{{self.version().strip()}}.tar.gz
a6ea4eb67ab46590e53936b0c7922b08ac2c5f4c9cc15a0bad177b70ca19a609
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
