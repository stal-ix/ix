{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/b64
bin/sed
bin/yajl
bin/nasm
bin/iconv
{% endblock %}
