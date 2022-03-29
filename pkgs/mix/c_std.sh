{% extends 'wrapped.sh' %}

{% block std_env %}
  {% if std_env %}
    {{std_env}}
  {% else %}
    {% block c_compiler %}
      bld/compiler
      {% block no_mold %}
        bld/linker
      {% endblock %}
    {% endblock %}
    {% if std_box %}
      {{std_box}}
    {% else %}
      {{super()}}
    {% endif %}
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
    {% include 'cross_tc.sh' %}
else
    source_env "${MIX_T_DIR}"
    setup_tc_here
fi
{% endblock %}

{% block step_setup %}
{% set cpp_flags %}
  {% if 'shut_up' in build_flags  %}
    -w
  {% endif %}

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

  {% set cpp_includes %}
    {% block cpp_includes %}
    {% endblock %}
  {% endset %}

  {% for f in mix.parse_list(cpp_includes) %}
    -I{{f}}
  {% endfor %}
{% endset %}

{% for f in mix.parse_list(cpp_flags) %}
export CPPFLAGS="{{f}} ${CPPFLAGS}"
{% endfor %}

{{super()}}
{% endblock %}
