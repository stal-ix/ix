{% extends '//die/registar.sh' %}

{% block lib_deps %}
lib/adwaita/unwrap
{% endblock %}

{% block constructors %}
adw_get_resource
adw_stylesheet_get_resource
{% endblock %}
