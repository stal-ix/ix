{% extends '//etc/services/runit/script/ix.sh' %}

{% block srv_command %}
exec evsieve \
    --input /dev/input/event* \
    --hook key:brightnessdown exec-shell="brightnessctl s 10%-" \
    --hook key:brightnessup exec-shell="brightnessctl s +10%"
{% endblock %}
