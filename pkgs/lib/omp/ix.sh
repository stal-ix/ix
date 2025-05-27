{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/omp/{{clang_ver or default_clang}}
{% endblock %}
