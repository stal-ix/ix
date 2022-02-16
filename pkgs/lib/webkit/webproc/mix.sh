{% extends '//lib/webkit/mix.sh' %}

{% block bld_libs %}
lib/webkit/drivers
{{super()}}
{% endblock %}

{% block ninja_threads %}14{% endblock %}

{% block install %}
{{super()}}

cd ${out}/bin

find ${out} -type f -executable | while read l; do
    mv "${l}" ./ || true
done

rm jsc
{% endblock %}
