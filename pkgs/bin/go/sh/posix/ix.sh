{% extends '//bin/go/sh/ix.sh' %}

{% block install %}
{{super()}}
cd ${out}/bin
mv gosh sh
{% endblock %}
