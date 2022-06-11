{% extends '//die/registar.sh' %}

{% block lib_deps %}
lib/dazzle/unwrap
{% endblock %}

{% block constructors %}
dzl_get_resource
{% endblock %}
