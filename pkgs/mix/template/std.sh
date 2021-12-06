{% extends 'base.sh' %}

{% block unpack %}
{% include 'blocks/unpack.sh' %}
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

{% block step_setup %}
{{super()}}
{% include 'blocks/preconf.sh' %}
{% endblock %}

{% block step_patch %}
{% include 'blocks/prepatch.sh' %}
{{super()}}
{% endblock %}

{% block std_box %}
env/std/mix.sh
{% endblock %}
