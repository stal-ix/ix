{% extends '//bin/ly/mix.sh' %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|/usr.*reset|/bin/reset|' \
        -e 's|.*tput cnorm.*||' \
        -i ${l}
done
{{super()}}
{% endblock %}
