{% extends '//mix/template/hub.sh' %}

{% block deps %}
{% if mix.platform.target.os == 'linux' %}
lib/{{libc or 'musl'}}/mix.sh
{% endif %}
{% endblock %}
