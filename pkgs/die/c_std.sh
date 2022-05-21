{% extends 'c_std_pre.sh' %}

{% block functions %}
{{super()}}

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

setup_target_env() {
    echo 'setup target env'
{% for f in mix.parse_list(cpp_flags) %}
    export CPPFLAGS="{{f}} ${CPPFLAGS}"
{% endfor %}
{% block setup %}
{% endblock %}
}
{% endblock %}

{% block setup_target %}
setup_target_env
{% endblock %}
