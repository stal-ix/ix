{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/mrustc/rustc
bin/mrustc/cargo
{% endblock %}
