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
    source_env "${1}"
    setup_compiler
    setup_ar
}

setup_tc() {
    mkdir ${2}; cd ${2}; setup_tc_here "${1}"; cd ..
}
{% endblock %}

{% block setup_compiler %}
if command -v ls; then
{% include 'cross_tc.sh' %}
else
    setup_tc_here "${MIX_T_DIR}"
fi
{% endblock %}
