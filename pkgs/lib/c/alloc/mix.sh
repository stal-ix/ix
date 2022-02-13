{% extends '//mix/hub.sh' %}

{% block lib_deps %}
{% if linux %}
lib/{{allocator or 'mimalloc'}}
{% else %}
{% if allocator %}
lib/{{allocator}}
{% endif %}
{% endif %}
{% endblock %}
