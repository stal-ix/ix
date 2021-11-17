{% extends 'blocks.sh' %}

{% block unpack %}
{% include 'blocks/unpack.sh' %}
{% endblock %}

{% block prepare_env %}
{% include 'blocks/env.sh' %}
{% endblock %}

{% block preconf %}
{% include 'blocks/preconf.sh' %}
{% endblock %}

{% block prepatch %}
{% block touch_yl %}
find . | grep '\.[yl]$' | while read l; do
    echo "TOUCH ${l}"
    touch ${l}
done
{% endblock %}
{% endblock %}

{% block bld_deps %}
{% block std_env %}
{% block std_box %}
env/std/mix.sh
{% endblock %}
{% endblock %}
{{super()}}
{% endblock %}
