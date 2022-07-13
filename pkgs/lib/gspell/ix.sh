{% extends '//die/registar.sh' %}

{% block lib_deps %}
lib/gspell/unwrap
{% endblock %}

{% block constructors %}
gspell_get_resource
{% endblock %}
