{% extends '//gnu/file/mix.sh' %}

{% block install %}
{{super()}}
rm -rf ${out}/bin
{% endblock %}
