{% extends '//bin/m4/19/ix.sh' %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
bld/boot/8/env/std
{% endblock %}

{% block test %}
echo 'skip tests'
{% endblock %}
