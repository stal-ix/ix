{% extends '//mix/template/py.py' %}

{% block lib_deps %}
dev/lang/clang/lib/cc/mix.sh
dev/lang/clang/lib/ar/mix.sh
dev/lang/clang/lib/ld/mix.sh
lib/build/mix.sh
{% endblock %}

{% block env %}
setup_toolchain_env() {
    setup_compiler_env
    setup_ar_env
}

setup_toolchain() {
    setup_compiler
    setup_ar

    export LDFLAGS=
    export CFLAGS=
    export CPPFLAGS=
    export CXXFLAGS=
    export CONLYFLAGS=
}
{% endblock %}
