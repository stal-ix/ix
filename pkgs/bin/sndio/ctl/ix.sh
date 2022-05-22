{% extends '//lib/sndio/ix.sh' %}

{% block install %}
{{super()}}
rm ${out}/bin/sndiod
{% endblock %}
