{% extends '//mix/hub.sh' %}

{% block lib_deps %}
# we define all opengl symbols in glesv2
lib/mesa/glesv2
{% endblock %}
