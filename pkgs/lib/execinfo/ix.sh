{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if linux %}
# fp/ need no-omit-frame-pointer
lib/execinfo/fake
{% endif %}
{% endblock %}
