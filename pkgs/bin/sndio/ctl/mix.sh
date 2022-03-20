{% extends '//lib/sndio/mix.sh' %}

{% block install %}
{{super()}}
rm ${out}/bin/sndiod
{% endblock %}
