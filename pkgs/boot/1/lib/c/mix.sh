{% extends '//mix/hub.sh' %}

{% block lib_deps %}
{% if target.os == 'linux' %}
boot/1/lib/musl
{% endif %}
{% if target.os == 'darwin' %}
lib/darwin/c
{% endif %}
{% endblock %}
