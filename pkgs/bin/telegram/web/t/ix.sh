{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/webview
bin/telegram/web/t/unwrap(flavor={{self.flavor().strip()}})
{% endblock %}
