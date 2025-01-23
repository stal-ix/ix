{% extends 't/ix.sh' %}

{% block patch %}
sed -e 's|error.*;|abort();|' -i libdw/libdw_alloc.c
{{super()}}
{% endblock %}

{% block configure_flags %}
{{super()}}
--disable-libdebuginfod
--disable-debuginfod
{% endblock %}

{% block install %}
{{super()}}
cp lib/libeu.a ${out}/lib/
{% endblock %}
