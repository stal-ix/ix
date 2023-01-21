{% extends 't/ix.sh' %}

{% block build_flags %}
{{super()}}
wrap_cc
{% endblock %}

{% block patch %}
{{super()}}
find . -type f | while read l; do
    sed -e 's|lib/kuroko|share|' -i ${l}
done
{% endblock %}
