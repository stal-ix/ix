{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/spirv/llvm/translator/{{default_clang}}
{% endblock %}
