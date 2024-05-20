{% extends '//lib/cap/t/ix.sh' %}

{% block fetch %}
https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.70.tar.gz
sha:d3b777ed413c9fafface03b917e171854709b5e4be38dbfb9219aaf7dfd4eea6
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
