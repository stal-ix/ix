{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
{% if mix.platform.target.os == 'linux' %}
lib/{{libc or 'musl'}}/mix.sh
{% endif %}
{% if mix.platform.target.os == 'darwin' %}
lib/darwin/c/mix.sh
{% endif %}
{% endblock %}
