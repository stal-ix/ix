{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/box
bin/rsync
bld/python
bin/ix/tools/mkfs/scripts
{% endblock %}
