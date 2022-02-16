{% extends '//bin/acpid/2/mix.sh' %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|/var/run/|/var/run/acpid2|' -i "${l}"
done

{{super()}}
{% endblock %}
