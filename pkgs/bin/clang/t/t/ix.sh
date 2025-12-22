{% extends '//lib/llvm/t/heavy/ix.sh' %}

{% block bld_libs %}
lib/c
lib/z
lib/c++
lib/kernel
{% if darwin %}
lib/darwin/framework/CoreFoundation
{% endif %}
{% endblock %}

{% block llvm_projects %}
clang
lld
polly
{% if 'flang' in self.llvm_all_targets() %}
flang
{% endif %}
{{llvm_extra_projects}}
{% endblock %}

{% block cmake_flags %}
{{super()}}
LLVM_ENABLE_TERMINFO=OFF
LLVM_ENABLE_PROJECTS="{{';'.join(ix.parse_list(self.llvm_projects()))}}"
CLANG_ENABLE_STATIC_ANALYZER=OFF
CLANG_ENABLE_ARCMT=OFF
{% endblock %}

{% block cmake_srcdir %}
llvm
{% endblock %}

{% block llvm_all_targets %}
{% block llvm_targets %}
{% endblock %}
{{llvm_extra_targets}}
{% endblock %}

{% block ninja_build_targets %}
{{self.llvm_all_targets()}}
{% endblock %}

{% block ninja_install_targets %}
{% for t in self.llvm_all_targets() | parse_list %}
install-{{t}}
{% endfor %}
{% endblock %}
