{% extends '//bin/clang/20/ix.sh' %}

{% block clang_major_version %}
22
{% endblock %}

{% block fetch %}
{% include '//lib/llvm/22/ver.sh' %}
{% endblock %}
