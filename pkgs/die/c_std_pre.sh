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
export CTRFLAGS=
export OPTFLAGS=
export CPPFLAGS=
export CXXFLAGS=
export CONLYFLAGS=
{% endblock %}

{% block setup_compiler %}
if command -v ls; then
    {% include 'cross_tc.sh' %}
else
    source_env "${IX_T_DIR}"
    setup_tc_here
fi
{% endblock %}
