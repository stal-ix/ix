{% extends '//mix/dlstubs.sh' %}

{% block lib_deps %}
lib/gstreamer/19
{% endblock %}

{% block export_lib %}
gstreamer
{% endblock %}

{% block export_symbols %}
gst_init_static_plugins
{% endblock %}
