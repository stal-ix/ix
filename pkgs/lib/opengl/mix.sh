{% extends '//mix/hub.sh' %}

{% block lib_deps %}
{% if target.os == 'linux' %}
lib/mesa
{% endif %}
{% if target.os == 'darwin' %}
lib/darwin/framework/Carbon
{% endif %}
{% endblock %}
