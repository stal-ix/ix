{% extends '//lib/lua/mix.sh' %}

{% block install %}
{{super()}}
rm -rf ${out}/lib ${out}/include
{% endblock %}
