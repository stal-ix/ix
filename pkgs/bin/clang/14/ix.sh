{% extends '//bin/clang/t/ix.sh' %}

{% block fetch %}
{% include '//lib/llvm/14/ver.sh' %}
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/execinfo
{% endblock %}

{% block std_box %}
bld/python
{{super()}}
{% endblock %}

{% block cmake_flags %}
{{super()}}
{% if llvm_native %}
LLVM_TARGETS_TO_BUILD={{target.llvm_target}}
{% endif %}
{% endblock %}

{% set clang_export_ver %}
{% block clang_export_ver %}
14.0.0
{% endblock %}
{% endset %}

{% block env %}
{{super()}}
export CLANG_VERSION={{clang_export_ver.strip()}}
{% endblock %}
