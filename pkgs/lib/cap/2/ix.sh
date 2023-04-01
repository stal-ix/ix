{% extends '//lib/cap/t/ix.sh' %}

{% block fetch %}
https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.68.tar.gz
sha:046e55716e0643b565efcd1dab1d26c5625709fcd0b5c271290c7ea1524cf906
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
