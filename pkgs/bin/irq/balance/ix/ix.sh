{% extends '//bin/irq/balance/ix.sh' %}

{% block patch %}
{{super()}}
find . -type f -name '*.h' | while read l; do
    sed -e 's|/run/|/var/run/|' ${l}
done
{% endblock %}
