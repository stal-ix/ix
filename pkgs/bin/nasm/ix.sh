{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if std_box or std_env %}
bin/nasm/old
{% else %}
bin/nasm/new
{% endif %}
{% endblock %}
