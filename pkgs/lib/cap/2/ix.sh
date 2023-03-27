{% extends '//lib/cap/t/ix.sh' %}

{% block fetch %}
https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.68.tar
sha:6c81724bd04dd11aa2e5651e50a8abae207cc02583b173b88389d1bd77d7585b
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
