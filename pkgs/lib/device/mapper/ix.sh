{% extends 't/ix.sh' %}

{% block configure_flags %}
{{super()}}
--enable-pkgconfig
--enable-static_link
{% endblock %}

{% block make_target %}
device-mapper
{% endblock %}

{% block make_install_target %}
install_device-mapper
{% endblock %}
