{% extends '//die/registar.sh' %}

{% block lib_deps %}
lib/dazzle/orig
{% endblock %}

{% block constructors %}
dzl_get_resource
{% endblock %}
