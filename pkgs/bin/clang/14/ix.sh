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

{% block clang_export_ver %}
14
{% endblock %}

{% block env %}
{{super()}}
export CLANG_HEADERS=${out}/share/include
export CLANG_VERSION={{self.clang_export_ver().strip()}}
export FREESTANDING_CLANG=clang-{{self.clang_export_ver().strip()}}
{% endblock %}
