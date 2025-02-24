{% extends '//die/dl/fix.sh' %}

{% block lib_deps %}
lib/glx
{% endblock %}

{% block export_symbols %}
glXGetProcAddressARB
{% endblock %}

{% block export_lib %}
GL
{% endblock %}
