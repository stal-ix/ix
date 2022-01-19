{% extends '//bin/m4/19/mix.sh' %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
boot/8/env/std
{% endblock %}

{% block test %}
echo 'skip tests'
{% endblock %}
