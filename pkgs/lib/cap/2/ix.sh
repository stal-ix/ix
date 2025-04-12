{% extends '//lib/cap/t/ix.sh' %}

{% block version %}
2.74
{% endblock %}

{% block fetch %}
https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-{{self.version().strip()}}.tar.gz
sha:10250c32cd3060bb6ca2b8470ae929fdb5459ba0cdec91c223a0271ab7f419fc
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
