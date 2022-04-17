{% extends '//mix/hub.sh' %}

{% block lib_deps %}
{% if linux %}
lib/{{allocator or 'mimalloc/2'}}
{% else %}
{% if allocator %}
lib/{{allocator}}
{% endif %}
{% endif %}
{% endblock %}
