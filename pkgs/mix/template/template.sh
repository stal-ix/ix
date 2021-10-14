{% extends 'base.sh' %}

{% block unpack %}
{% include 'blocks/unpack.sh' %}
{% endblock %}

{% block preconf %}
{% include 'blocks/preconf.sh' %}
{% endblock %}

{% block prepare_env %}
{% include 'blocks/env.sh' %}
{% endblock %}

{% block prepatch %}
{% block touch_yl %}
find . | grep \\.[yl] | while read l; do
    echo "TOUCH ${l}"
    touch ${l}
done
{% endblock %}
{% endblock %}
