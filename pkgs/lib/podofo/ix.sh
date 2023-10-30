{% extends 't/ix.sh' %}

{% block install %}
{{super()}}
cp ${out}/lib/libpodofo.so ${out}/lib/libpodofo.a
{% endblock %}
