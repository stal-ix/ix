{% extends '//lib/llvm/t/mix.sh' %}

{% block bld_libs %}
{% if target.os == 'linux' %}
lib/linux/mix.sh
{% endif %}
{% if target.os == 'darwin' %}
lib/darwin/framework/CoreFoundation/mix.sh
{% endif %}
lib/c++/mix.sh
lib/compiler_rt/builtins/mix.sh
{% endblock %}

{% block ind_deps %}
dev/lang/clang/lib/mix.sh
{% endblock %}

{% block cmake_flags %}
{{super()}}
LLVM_ENABLE_PROJECTS="clang;lld;polly"
{% endblock %}

{% block cmake_srcdir %}
llvm
{% endblock %}

{% block install %}
{{super()}}

mv ${out}/lib/clang/13*/include ${out}/share/
rm -rf ${out}/libexec

python3 << EOF
{% include 'strip.py' %}
EOF
{% endblock %}

{% block env %}
export CLANG_VERSION=13.0.0
export CPPFLAGS="-isystem ${out}/share/include \${CPPFLAGS}"
{% endblock %}
