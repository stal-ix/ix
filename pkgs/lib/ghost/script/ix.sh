{% extends 't/ix.sh' %}

{% block make_target %}
so
{% endblock %}

{% block make_install_target %}
soinstall
{% endblock %}

{% block build_flags %}
{{super()}}
wrap_cc
{% endblock %}
