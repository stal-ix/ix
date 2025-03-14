{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if force_allocator %}
lib/{{force_allocator}}
{% elif linux %}
lib/{{allocator or 'gperftools'}}
{% elif darwin %}
lib/reallocarray
lib/reallocarray/headers
{% else %}
{% if allocator %}
lib/{{allocator}}
{% endif %}
{% endif %}
{% endblock %}
