{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/png/{{libpng_ver or 'stock'}}
{% endblock %}
