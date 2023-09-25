{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/fusermount/3
bin/unionfs/fuse/unwrap
{% endblock %}
