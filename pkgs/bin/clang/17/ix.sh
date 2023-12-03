{% extends '//bin/clang/16/ix.sh' %}

{% block fetch %}
{% include '//lib/llvm/17/ver.sh' %}
{% endblock %}

{% block clang_export_ver %}
17.0.0
{% endblock %}

{% block llvm_targets %}
{{super()}}
llvm-dlltool
llvm-otool
llvm-rc
llvm-undname
llvm-windres
{% endblock %}
