{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/ananicy/cpp(libcplpl_ver=15)
{% endblock %}

{% block run_data %}
bin/ananicy/good
{% endblock %}
