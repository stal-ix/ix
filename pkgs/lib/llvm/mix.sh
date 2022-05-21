{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/llvm/{{llvm_ver or '14'}}
{% endblock %}
