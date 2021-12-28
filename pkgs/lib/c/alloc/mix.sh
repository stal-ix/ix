{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
{% if target.os == 'linux' %}
lib/{{allocator or 'mimalloc'}}
{% else %}
{% if allocator %}
lib/{{allocator}}
{% endif %}
{% endif %}
{% endblock %}
