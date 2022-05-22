{% extends '//bin/yash/ix.sh' %}

{% block install %}
{{super()}}
cd ${out}/bin
mv yash sh
{% endblock %}
