{% extends 't/ix.sh' %}

{% block make_target %}
lib-static
{% endblock %}

{% block make_install_target %}
install-lib-static
{% endblock %}

{% block configure_all_flags %}
{{super()}}
--disable-cli
--enable-static
{% endblock %}
