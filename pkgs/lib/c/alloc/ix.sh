{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if force_allocator %}
lib/{{force_allocator}}
{% elif sanitize == 'address' %}
{# AddressSanitizer already has a built-in allocator #}
{% elif linux %}
lib/{{allocator or default_allocator}}
{% elif darwin %}
lib/reallocarray
lib/reallocarray/headers
{% else %}
{% if allocator %}
lib/{{allocator}}
{% endif %}
{% endif %}
{% endblock %}
