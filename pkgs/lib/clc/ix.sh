{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/clc/{{clang_ver or default_clang}}
{% endblock %}
