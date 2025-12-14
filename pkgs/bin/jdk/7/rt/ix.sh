{% extends '//die/dl/fix.sh' %}

{% block export_lib %}
rt
{% endblock %}

{% block export_symbols %}
sigset
signal
sigaction
clock_getres
clock_gettime
pthread_getcpuclockid
{% endblock %}
