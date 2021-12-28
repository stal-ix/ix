{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
{% if target.os == 'linux' %}
boot/3/lib/musl
{% endif %}
{% if target.os == 'darwin' %}
lib/darwin/c
{% endif %}
{% endblock %}
