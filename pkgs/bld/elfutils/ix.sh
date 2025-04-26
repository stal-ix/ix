{% extends '//bin/elfutils/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/kernel
{% endblock %}

{% block configure_flags %}
{{super()}}
--disable-debuginfod
--disable-libdebuginfod
{% endblock %}

{% block install %}
{{super()}}
# stub conflict
rm ${out}/bin/strip
{% endblock %}
