{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/sud/client/unwrap(openssl=1,curses=netbsd)
{% endblock %}
