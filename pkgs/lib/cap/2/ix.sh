{% extends '//lib/cap/t/ix.sh' %}

{% block fetch %}
https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.69.tar.gz
sha:3a99ec26452e328e0ea408efd67096ef914f4ee4788fa8e8e21f214e2bd670b9
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
