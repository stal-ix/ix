{% extends '//die/inline/library.sh' %}

{% block c_flags %}
-fno-builtin
{% endblock %}

{% block sources %}
fakes.c
{% endblock %}
