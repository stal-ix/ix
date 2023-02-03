{% extends '//die/inline/library.sh' %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block sources %}
stdlib.h
stdlib.c
{% endblock %}

{% block env %}
export ac_cv_func_canonicalize_file_name=yes
{% endblock %}
