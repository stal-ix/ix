{% extends 't/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/kernel
{% endblock %}

{% block patch %}
sed -e 's|error.*;|abort();|' -i libdw/libdw_alloc.c
# lib/argp/standalone dep
cat << EOF > libdwfl/argp-std.c
int dwfl_standard_argp;
EOF
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
