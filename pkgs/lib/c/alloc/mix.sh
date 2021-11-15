{% extends '//mix/template/hub.sh' %}

{% block deps %}
{% if mix.platform.target.os == 'linux' %}
lib/{{allocator or 'mimalloc'}}/mix.sh
{% else %}
{% if allocator %}
lib/{{allocator}}/mix.sh
{% endif %}
{% endif %}
{% endblock %}
