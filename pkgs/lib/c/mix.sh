{% extends '//mix/template/hub.sh' %}

{% block deps %}
{% if mix.platform.target.os == 'linux' %}
lib/musl/mix.sh
lib/mimalloc/mix.sh
{% endif %}
{% endblock %}
