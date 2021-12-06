{% extends 'blocks.sh' %}

{% block unpack %}
{% include 'blocks/unpack.sh' %}
{% endblock %}

{% block prepare_env %}
{% include 'blocks/env.sh' %}
{% endblock %}

{% block step_setup %}
{{super()}}

{% block preconf %}
{% include 'blocks/preconf.sh' %}
{% endblock %}
{% endblock %}

{% block step_patch %}
{% block prepatch %}
{% include 'blocks/prepatch.sh'%}
{% endblock %}

{{super()}}
{% endblock %}

{% block postinstall %}
{% include 'blocks/postinstall.sh' %}
{% endblock %}

{% block std_box %}
env/std/mix.sh
{% endblock %}
