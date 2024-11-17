{% extends 'ix3.sh' %}

{% block cxx_flags %}
{% endblock %}

{% block c_flags %}
{% endblock %}

{% block ld_flags %}
{% endblock %}

{% block opt_flags %}
{% endblock %}

{% block script_functions %}
{{super()}}

{% set cpp_flags %}
  {% if 'shut_up' in build_flags  %}
    -w
  {% endif %}

  {% if 'no_werror' in build_flags  %}
    -Wno-error
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

    {% for f in ix.parse_list(c_rename_symbol) %}
      {{f}}={{uniq_id}}_{{f}}
    {% endfor %}
  {% endset %}

  {% for f in ix.parse_list(cpp_defines) %}
    -D{{f}}
  {% endfor %}

  {% set cpp_includes %}
    {% block cpp_includes %}
    {% endblock %}
  {% endset %}

  {% set cpp_missing %}
    {% block cpp_missing %}
    {% endblock %}
  {% endset %}

  {% for f in ix.parse_list(cpp_includes) %}
    -I{{f}}
  {% endfor %}

  {% for f in ix.parse_list(cpp_missing) %}
    -include{{f}}
  {% endfor %}
{% endset %}

setup_target_env() {
    echo 'setup target env'
{% for f in ix.parse_list(cpp_flags) %}
    export CPPFLAGS="{{f}} ${CPPFLAGS}"
{% endfor %}
{% block setup_target_flags %}
{% for f in ix.parse_list(self.cxx_flags()) %}
    export CXXFLAGS="{{f}} ${CXXFLAGS}"
{% endfor %}
{% for f in ix.parse_list(self.c_flags()) %}
    export CFLAGS="{{f}} ${CFLAGS}"
{% endfor %}
{% for f in ix.parse_list(self.ld_flags()) %}
    export LDFLAGS="{{f}} ${LDFLAGS}"
{% endfor %}
{% for f in ix.parse_list(self.opt_flags()) %}
    export OPTFLAGS="{{f}} ${OPTFLAGS}"
{% endfor %}
{% endblock %}
}
{% endblock %}

{% block setup_target %}
setup_target_env
{% endblock %}
