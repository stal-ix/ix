{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
{% if mix.platform.target.os == 'linux' %}
boot/8/lib/musl/mix.sh
boot/8/lib/mimalloc/mix.sh
{% endif %}
{% endblock %}
