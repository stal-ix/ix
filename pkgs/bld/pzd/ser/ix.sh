{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/zstd
bld/python
bld/pzd/ser/scripts
{% endblock %}
