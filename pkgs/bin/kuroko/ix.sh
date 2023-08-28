{% extends 't/ix.sh' %}

{% block fetch %}
https://github.com/kuroko-lang/kuroko/archive/refs/tags/v1.4.0.tar.gz
sha:
{% endblock %}

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
