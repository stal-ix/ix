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
{% include 'blocks/prepatch.sh'%}
{% endblock %}

{% block postinstall %}
{% if lib %}
rm -rf ${out}/bin
{% else %}
rm -rf ${out}/lib ${out}/include
{% endif %}
{% endblock %}

{% block std_box %}
env/std/mix.sh
{% endblock %}
