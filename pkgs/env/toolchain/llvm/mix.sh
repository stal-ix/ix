{% extends '//mix/template/py.py' %}

{% block lib_deps %}
env/toolchain/cc/clang/mix.sh
env/toolchain/ar/llvm/mix.sh
env/toolchain/ld/lld/mix.sh
{% endblock %}

{% block env %}
setup_toolchain() {
    setup_compiler
    setup_ar

    export LDFLAGS=
    export LIBS=
    export CFLAGS=
    export CPPFLAGS=
    export CXXFLAGS=
    export CONLYFLAGS=
}
{% endblock %}
