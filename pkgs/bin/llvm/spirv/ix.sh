{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/llvm/spirv/{{default_clang}}
{% endblock %}
