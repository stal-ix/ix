{% extends '//bin/clang/14/ix.sh' %}

{% block ind_deps %}
bin/clang/lib
{% endblock %}

{% block patch %}
sed -e 's|__SSE2__|__NOPE__|g' -i clang/lib/Lex/Lexer.cpp
{{super()}}
{% endblock %}

{% block build_flags %}
shut_up
{{super()}}
{% endblock %}

{% block cmake_flags %}
{{super()}}
LLVM_TARGETS_TO_BUILD={{target.llvm_target}}
{% endblock %}

{% block postinstall %}
rm -rf ${out}/lib ${out}/include
{% endblock %}
