{% extends '//bin/clang/15/ix.sh' %}

{% block fetch %}
{% include '//lib/llvm/16/ver.sh' %}
{% endblock %}

{% block bld_libs %}
lib/zstd
{{super()}}
{% endblock %}

{% block clang_export_ver %}
16.0.0
{% endblock %}
