{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/gnupg
bin/fusermount/2
bin/squashfs/tools
bin/xdg/file/utils
bin/app/image/tool/unwrap(fuse_ver=2)
{% endblock %}
