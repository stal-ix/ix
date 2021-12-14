{% extends '//mix/template/base.sh' %}

{% include 'unpack.sh' %}

{% block step_setup %}
CD=${PWD}
{{super()}}
{% include 'preconf.sh' %}
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
{% include 'postinstall.sh' %}
{% endblock %}
)

(
    set -eu

{% block prepare_env %}
{% include 'env.sh' %}
{% endblock %}
)
{% endblock %}

{% block std_env %}
{% block std_box %}
{% block shell %}
shell/cli/dash/minimal/mix.sh
{% endblock %}

{% block box %}
gnu/box/mix.sh
{% endblock %}

{% block decompressor %}
tool/pv/mix.sh
tool/compress/unzip/mix.sh
lib/archive/mix.sh
{% endblock %}
{% endblock %}
{% endblock %}
