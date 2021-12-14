{% extends 'base.sh' %}

{% include 'blocks/unpack.sh' %}

{% block step_setup %}
CD=${PWD}
{{super()}}
{% include 'blocks/preconf.sh' %}
cd ${CD}
{% endblock %}

{% block step_install %}
{% if super().strip() %}
(
    set -eu

{{super()}}
)
{% endif %}

(
    set -eu

{% block postinstall %}
{% include 'blocks/postinstall.sh' %}
{% endblock %}
)

(
    set -eu

{% block prepare_env %}
{% include 'blocks/env.sh' %}
{% endblock %}
)
{% endblock %}

{% block std_box %}
env/std/mix.sh
{% endblock %}
