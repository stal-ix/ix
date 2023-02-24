{% extends '//bin/bc/gavin/t/ix.sh' %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block setup %}
export PATH=${PWD}/bin:${PATH}
{{super()}}
{% endblock %}
