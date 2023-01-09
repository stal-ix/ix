{% extends 't/ix.sh' %}

{% block lib_deps %}
lib/c
lib/md
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block env %}
{{super()}}
export BSD_HEADERS=${out}/include/bsd
{% endblock %}
