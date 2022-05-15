{% extends '//lib/elfutils/t/mix.sh' %}

{% block patch %}
sed -e 's|error.*;|abort();|' -i libdw/libdw_alloc.c
{{super()}}
{% endblock %}

{% block configure_flags %}
{{super()}}
--disable-libdebuginfod
--disable-debuginfod
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/elfutils \${CPPFLAGS}"
{% endblock %}
