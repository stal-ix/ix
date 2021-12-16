{% extends 'std/mix.sh' %}

{% block std_env %}
{% block c_compiler %}
dev/lang/clang/mix.sh
{% endblock %}
{{super()}}
{% endblock %}

{% block functions %}
{{super()}}

setup_tc_here() {
    setup_compiler
    setup_ar
}

setup_tc() {
    mkpushd ${1}; setup_tc_here; popd
}
{% endblock %}

{% block setup_compiler %}
if command -v ls; then
    mkpushd tc
    {% include 'cross_tc.sh' %}
    export PATH="${PWD}:${PATH}"; popd
else
    source_env "${MIX_T_DIR}"
    setup_tc_here
fi
{% endblock %}
