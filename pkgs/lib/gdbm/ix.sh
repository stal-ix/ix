{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/gdbm/{{libgdbm_ver or 'full'}}
{% endblock %}
