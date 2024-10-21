{% extends '//die/fetch.sh' %}

{% set build_flags %}
{% block all_build_flags %}
{% block build_flags %}
{% endblock %}
{% if lib and 'wrap_cc' in self.build_flags() %}
rename_dynlib
{% endif %}
{% endblock %}
{% endset %}

{% block script_functions %}
{{super()}}
{% include 'functions.sh' %}
{% endblock %}

{% block unpack %}
unpack_f
{% endblock %}

{% block step_setup %}
step_setup_f
{% endblock %}

{% block step_install %}
step_install_f
{% endblock %}

{% block std_env %}
  {% block std_box %}
    {% block shell %}
      bld/sh
    {% endblock %}
    {% block box %}
      bld/box
    {% endblock %}
    {% block decompressor %}
      bld/extract
    {% endblock %}
  {% endblock %}
{% endblock %}
