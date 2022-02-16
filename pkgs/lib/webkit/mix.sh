{% extends '//lib/webkit/t/mix.sh' %}

{% block install %}
{{super()}}

cd ${out}/lib

find ${tmp}/obj -type f | grep '\.a' | while read l; do
    cp ${l} ./
done
{% endblock %}
