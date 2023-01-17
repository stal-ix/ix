{% extends '//bin/unbound/ix.sh' %}

{% block install %}
{{super()}}
rm ${out}/bin/unbound-*
{% endblock %}
