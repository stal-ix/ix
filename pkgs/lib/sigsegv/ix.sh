{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if linux %}
lib/sigsegv/gnu
{% endif %}
{% endblock %}
