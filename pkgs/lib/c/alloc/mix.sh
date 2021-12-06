{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
{% if target.os == 'linux' %}
lib/{{allocator or 'mimalloc'}}/mix.sh
{% else %}
{% if allocator %}
lib/{{allocator}}/mix.sh
{% endif %}
{% endif %}
{% endblock %}
