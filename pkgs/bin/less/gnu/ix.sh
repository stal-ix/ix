{% extends '//bin/less/ix.sh' %}

{% block install %}
{{super()}}
cd ${out}/bin
mv less gnuless
{% endblock %}
