{% extends 'std/mix.sh' %}

{% block std_env %}
{% if std_env %}
{{std_env}}
{% else %}
{% block c_compiler %}
dev/lang/clang/opt/mix.sh
{% endblock %}
{{super()}}
{% endif %}
{% endblock %}

{% block functions %}
{{super()}}

setup_tc_here() {
    setup_compiler
    setup_ar
}

setup_tc() {
    mkpushd ${1}
    setup_tc_here
    popd
}
{% endblock %}

{% block script_init_env %}
{{super()}}
export CFLAGS=
export LDFLAGS=
export OPTFLAGS=
export CPPFLAGS=
export CXXFLAGS=
export CONLYFLAGS=
{% endblock %}

{% block setup_compiler %}
if command -v ls; then
    mkpushd tc
    {% include 'cross_tc.sh' %}
    export PATH="${PWD}:${PATH}"
    popd
else
    source_env "${MIX_T_DIR}"
    setup_tc_here
fi
{% endblock %}

{% block step_setup %}
{% set cpp_flags %}
  {% block cpp_flags %}
  {% endblock %}

  {% set cpp_defines %}
    {% block cpp_defines %}
    {% endblock %}

    {% set c_rename_symbol %}
      {% block c_rename_symbol %}
      {% endblock %}
    {% endset %}

    {% for f in mix.parse_list(c_rename_symbol) %}
      {{f}}={{uniq_id}}_{{f}}
    {% endfor %}
  {% endset %}

  {% for f in mix.parse_list(cpp_defines) %}
    -D{{f}}
  {% endfor %}
{% endset %}

{% for f in mix.parse_list(cpp_flags) %}
export CPPFLAGS="{{f}} ${CPPFLAGS}"
{% endfor %}

{{super()}}
{% endblock %}
