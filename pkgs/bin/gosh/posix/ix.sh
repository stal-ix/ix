{% extends '//bin/gosh/ix.sh' %}

{% block install %}
{{super()}}
cd ${out}/bin
mv gosh sh
{% endblock %}
