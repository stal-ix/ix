{% extends '//mix/dlstubs.sh' %}

{% block lib_deps %}
lib/rsvg/plugin
{% endblock %}

{% block export_symbols %}
svg_fill_info
svg_fill_vtable
{% endblock %}

{% block export_lib %}
rsvg_plugin
{% endblock %}
