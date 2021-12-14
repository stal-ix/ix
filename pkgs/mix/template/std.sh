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

{% block std_env %}
alt/c/mix.sh
alt/box/mix.sh
shell/cli/dash/minimal/mix.sh
tool/pv/mix.sh
tool/compress/unzip/mix.sh
lib/archive/mix.sh
{% endblock %}
