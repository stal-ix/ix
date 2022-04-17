{% extends '//lib/web/kit/t/mix.sh' %}

{% block bld_libs %}
lib/web/kit/deps
{{super()}}
{% endblock %}

{% block install %}
{{super()}}

cd ${out}/bin

find ${out} -type f -executable | while read l; do
    mv "${l}" ./ || true
done

rm -rf jsc bin_*
{% endblock %}
