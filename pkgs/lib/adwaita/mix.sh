{% extends '//mix/registar.sh' %}

{% block lib_deps %}
lib/adwaita/orig
{% endblock %}

{% block constructors %}
adw_get_resource
adw_stylesheet_get_resource
{% endblock %}
