{% extends 'ix3.sh' %}

{% block cxx_flags %}
{% endblock %}

{% block c_flags %}
{% endblock %}

{% block ld_flags %}
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

    {% for f in c_rename_symbol | parse_list %}
      {{f}}={{uniq_id}}_{{f}}
    {% endfor %}
  {% endset %}

  {% for f in cpp_defines | parse_list %}
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

  {% for f in cpp_includes | parse_list %}
    -I{{f}}
  {% endfor %}

  {% for f in cpp_missing | parse_list %}
    -include{{f}}
  {% endfor %}
{% endset %}

setup_target_env() {
    echo 'setup target env'
{% for f in cpp_flags | parse_list %}
    export CPPFLAGS="{{f}} ${CPPFLAGS}"
{% endfor %}
{% block setup_target_flags %}
{% for f in self.cxx_flags() | parse_list %}
    export CXXFLAGS="{{f}} ${CXXFLAGS}"
{% endfor %}
{% for f in self.c_flags() | parse_list %}
    export CFLAGS="{{f}} ${CFLAGS}"
{% endfor %}
{% for f in self.ld_flags() | parse_list %}
    export LDFLAGS="{{f}} ${LDFLAGS}"
{% endfor %}
{% endblock %}
}
{% endblock %}

{% block setup_target %}
setup_target_env
{% endblock %}
