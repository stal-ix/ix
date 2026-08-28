{% extends '//lib/cap/t/ix.sh' %}

{% block pkg_name %}
libcap
{% endblock %}

{% block version %}
2.78
{% endblock %}

{% block fetch %}
https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-{{self.version().strip()}}.tar.gz
2a2c705e382c413643a458b837575c0eb0989477ab6fb99c87adbe9a259612ad
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
