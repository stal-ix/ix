{% extends '//lib/wayland/protocols/t/ix.sh' %}

{% block strip_pc %}
{% endblock %}

{% block postinstall %}
: keep generated protocol headers for build-time consumers
{% endblock %}

{% block env %}
export WL_PROTOCOL_DIR=${out}/share/wayland-protocols
{% endblock %}
