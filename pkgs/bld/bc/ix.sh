{% extends '//bin/bc/gavin/t/ix.sh' %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block install %}
export PATH=${PWD}/bin:${PATH}
{{super()}}
{% endblock %}
