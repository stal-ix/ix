{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/llvm/{{clang_ver or default_clang}}
{% endblock %}
