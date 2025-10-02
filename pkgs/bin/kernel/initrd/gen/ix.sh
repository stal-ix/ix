{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/zstd
bld/python
bin/kernel/initrd/gen/scripts
{% endblock %}
