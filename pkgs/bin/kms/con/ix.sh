{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/kms/con/static
bin/xdg/er(wrap=kmscon)
{% endblock %}
