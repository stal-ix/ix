{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if wasi %}
lib/heif/wasi
{% else %}
lib/heif/common
{% endif %}
{% endblock %}
