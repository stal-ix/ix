{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
{% if target.os == 'linux' %}
lib/{{libc or 'musl'}}
{% endif %}
{% if target.os == 'darwin' %}
lib/darwin/c
{% endif %}
{% endblock %}
