{% extends 'full/mix.sh' %}

{% block install %}
{{super()}}
cd ${out}/bin
rm wget less
{% endblock %}
