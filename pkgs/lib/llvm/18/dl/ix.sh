{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/llvm/18
{% endblock %}

{% block export_libs %}
libclang.a
{% endblock %}

{% block export_lib %}
clang
{% endblock %}
