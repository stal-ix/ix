{% extends 'base.sh' %}

{% block unpack %}
{% include 'blocks/unpack.sh' %}
{% endblock %}

{% block step_setup %}
CD=${PWD}
{{super()}}
{% include 'blocks/preconf.sh' %}
cd ${CD}
{% endblock %}

{% block step_install %}
{{super()}}

{% block postinstall %}
{% include 'blocks/postinstall.sh' %}
{% endblock %}

{% block prepare_env %}
{% include 'blocks/env.sh' %}
{% endblock %}
{% endblock %}

{% block std_box %}
env/std/mix.sh
{% endblock %}
