{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/harfbuzz
{% endblock %}

{% block export_libs %}
libharfbuzz-gobject.a
{% endblock %}

{% block export_lib %}
harfbuzz-gobject
{% endblock %}
