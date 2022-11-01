{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/ananicy/cpp(execinfo_ver=fake)
{% endblock %}

{% block run_data %}
bin/ananicy/good
{% endblock %}
