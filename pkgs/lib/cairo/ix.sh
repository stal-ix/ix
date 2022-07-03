{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/cairo/{{cairo_ver or 'stock'}}
{% endblock %}
