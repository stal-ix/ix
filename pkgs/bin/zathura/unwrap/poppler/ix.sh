{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/zathura/unwrap(pdf_plugin=poppler)
{% endblock %}
