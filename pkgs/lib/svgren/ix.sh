{% extends 't/ix.sh' %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/svgren/dom
lib/svgren/agg
lib/svgren/rasterimage
{% endblock %}

{% block build_flags %}
{{super()}}
shut_up
{% endblock %}
