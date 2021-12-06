{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
{% if target.os == 'linux' %}
boot/8/lib/musl/mix.sh
boot/8/lib/mimalloc/mix.sh
{% endif %}
{% if target.os == 'darwin' %}
lib/darwin/c/mix.sh
{% endif %}
{% endblock %}
