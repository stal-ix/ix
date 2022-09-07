{% extends '//bin/clang/14/ix.sh' %}

{% block fetch %}
{% include '//lib/llvm/15/ver.sh' %}
{% endblock %}

{% block clang_export_ver %}
15.0.0
{% endblock %}
