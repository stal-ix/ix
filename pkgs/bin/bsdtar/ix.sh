{% extends '//lib/archive/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/intl
lib/nettle
lib/archive/deps
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
test -f ${out}/bin/bsdtar{{target.exe_suffix}}
{% endblock %}
