{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if wasi %}
lib/djvulibre/wasi
{% else %}
lib/djvulibre/common
{% endif %}
{% endblock %}
