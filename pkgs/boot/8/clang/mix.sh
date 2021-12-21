{% extends '//dev/lang/clang/mix.sh' %}

{% block bld_libs %}
boot/3/lib/c/mix.sh
{% if target.os == 'linux' %}
boot/7/lib/linux/mix.sh
{% endif %}
{% if target.os == 'darwin' %}
lib/darwin/framework/CoreFoundation/mix.sh
{% endif %}
boot/7/lib/runtime/mix.sh
boot/7/lib/compiler_rt/mix.sh
{% endblock %}

{% block bld_deps %}
boot/7/env/cxx/mix.sh
{% endblock %}

{% block patch %}
sed -e 's|__SSE2__|__NOPE__|g' -i clang/lib/Lex/Lexer.cpp

patch -p1 << EOF
{% include '00.diff' %}
EOF

patch -p1 << EOF
{% include '01.diff' %}
EOF

{{super()}}
{% endblock %}

{% block setup %}
export CPPFLAGS="-w ${CPPFLAGS}"
{{super()}}
{% endblock %}

{% block cmake_flags %}
{{super()}}
LLVM_TARGETS_TO_BUILD={{target.llvm_target}}
{% endblock %}
