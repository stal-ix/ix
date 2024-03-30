{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/zstd
bld/python
bld/pzd/scripts
{% endblock %}
