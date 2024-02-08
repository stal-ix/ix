{% extends '//die/fetch.sh' %}

{% set build_flags %}
{% block all_build_flags %}
{% block build_flags %}
{% endblock %}
{% endblock %}
{% endset %}

{% block functions %}
{{super()}}
{% include 'functions.sh' %}
{% endblock %}

{% block unpack %}
{% include 'unpack.sh' %}
{% endblock %}

{% block step_setup %}
export bld=${PWD}
{% include 'setup.sh' %}
{% endblock %}

{% block step_install %}
{% include 'install.sh' %}
{% endblock %}

{% block std_env %}
{% block std_box %}
{% include 'stdenv.sh' %}
{% endblock %}
{% endblock %}
