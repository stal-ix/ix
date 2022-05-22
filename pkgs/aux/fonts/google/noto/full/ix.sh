{% extends '//aux/fonts/google/ix.sh' %}

{% block install %}
{{super()}}

cd ${out}/share/fonts

find . -type f | grep -v 'Noto' | while read l; do
    rm ${l}
done
{% endblock %}
