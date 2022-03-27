{% extends '//mix/dlstubs.sh' %}

{% block export_lib %}
gstreamer
{% endblock %}

{% block export_symbols %}
gst_init_static_plugins
{% endblock %}
