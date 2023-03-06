{% extends '//bin/unbound/t/ix.sh' %}

{% block install %}
{{super()}}
rm ${out}/bin/unbound-*
{% endblock %}
