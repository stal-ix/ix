{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/spirv/llvm/translator/{{clang_ver or default_clang}}
{% endblock %}
