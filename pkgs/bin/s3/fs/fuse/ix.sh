{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/fusermount/2
bin/s3/fs/fuse/unwrap
{% endblock %}
