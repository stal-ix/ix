{% extends '//bin/clang/20/ix.sh' %}

{% block clang_major_version %}
21
{% endblock %}

{% block fetch %}
{% include '//lib/llvm/21/ver.sh' %}
{% endblock %}
