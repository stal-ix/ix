{% extends '//bin/seatd/mix.sh' %}

{% block install %}
{{super()}}
rm ${out}/bin/seatd-launch
{% endblock %}
