{% extends '//lib/jack/2/t/ix.sh' %}

{% block install %}
{{super()}}
cd ${out}/lib
rm -r jack libjackserver.a
{% endblock %}
