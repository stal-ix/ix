{% extends '//lib/gmime/ix.sh' %}

{% block install %}
{{super()}}
mkdir -p ${out}/bin
cp examples/uuencode ${out}/bin/
cp examples/uudecode ${out}/bin/
{% endblock %}
