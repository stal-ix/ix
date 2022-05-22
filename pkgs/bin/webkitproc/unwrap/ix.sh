{% extends '//lib/web/kit/gtk/t/ix.sh' %}

{% block bld_libs %}
lib/web/kit/deps
lib/{{allocator}}/trim(delay=1,bytes=10000000)
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
