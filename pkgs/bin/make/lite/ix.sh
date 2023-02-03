{% extends '//bin/make/ix.sh' %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block env %}
{{super()}}
export am_cv_make_support_nested_variables=yes
{% endblock %}
