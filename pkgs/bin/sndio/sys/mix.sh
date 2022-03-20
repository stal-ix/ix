{% extends '//bin/sndio/d/mix.sh' %}

{% block patch %}
sed -e 's|geteuid() == 0|0|' -i sndiod/sndiod.c
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
rm -r ${out}/share
{% endblock %}
