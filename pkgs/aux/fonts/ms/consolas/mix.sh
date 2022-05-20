{%extends '//aux/fonts/ms/vista/mix.sh' %}

{% block install %}
{{super()}}
cd ${out}/share/fonts
find . -type f | grep -v consol | while read l; do
    rm ${l}
done
{% endblock %}
