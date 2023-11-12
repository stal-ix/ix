{% extends '//lib/archive/t/ix.sh' %}

{% block bld_libs %}
lib/intl
lib/nettle
{{super()}}
{% endblock %}

{% block cmake_flags %}
{{super()}}
ENABLE_NETTLE=ON
{% endblock %}

{% block build_flags %}
{{super()}}
wrap_cc
{% endblock %}

{% block test %}
test -f ${out}/bin/bsdtar
{% endblock %}
