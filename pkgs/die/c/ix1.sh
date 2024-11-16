{% extends 'ix0.sh' %}

{% block std_env %}
  {% if std_env %}
    {{std_env}}
  {% else %}
    {% if std_box %}
      {{std_box}}
    {% else %}
      {{super()}}
    {% endif %}
    {% block c_compiler %}
      {% if c_compiler %}
        {{c_compiler}}
      {% else %}
        bld/compiler(clang_ver={{clang_ver}})
      {% endif %}
    {% endblock %}
  {% endif %}
{% endblock %}

{% block script_functions %}
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
export CTRFLAGS=
export OPTFLAGS=
export CPPFLAGS=
export CXXFLAGS=
export CONLYFLAGS=
{% endblock %}

{% block setup_compiler %}
{% include 'cross_tc.sh' %}
{% endblock %}
