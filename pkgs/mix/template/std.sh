{% extends 'pkg.sh' %}

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
