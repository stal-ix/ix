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
    mkdir ${1}; cd ${1}; setup_tc_here; cd ..
}
{% endblock %}

{% block setup_compiler %}
if command -v ls; then
{% include 'cross_tc.sh' %}
else
    source_env "${MIX_T_DIR}"
    setup_tc_here
fi
{% endblock %}
