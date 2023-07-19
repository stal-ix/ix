{% extends '//lib/archive/ix.sh' %}

{% block bld_libs %}
lib/intl
lib/nettle
{{super()}}
{% endblock %}

{% block cmake_flags %}
{{super()}}
ENABLE_NETTLE=ON
{% endblock %}

{% block test %}
test -f ${out}/bin/bsdtar
{% endblock %}
