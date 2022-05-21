{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if linux %}
lib/{{allocator or 'tcmalloc'}}
{% else %}
{% if allocator %}
lib/{{allocator}}
{% endif %}
{% endif %}
{% endblock %}
