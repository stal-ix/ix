{% extends '//lib/llvm/13/ix.sh' %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block cmake_flags %}
{{super()}}
LLVM_BUILD_TOOLS=ON
{% endblock %}

{% block build_flags %}
{{super()}}
shut_up
{% endblock %}

{% block postinstall %}
:
{% endblock %}
