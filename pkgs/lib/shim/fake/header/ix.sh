{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/shim/redir(from={{header}},to=stdio.h)
{% endblock %}
