{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/glib/{{libglib_ver or 'ix'}}
{% endblock %}
