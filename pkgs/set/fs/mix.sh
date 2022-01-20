{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
bin/parted
bin/xfsprogs
bin/gptfdisk
bin/e2fsprogs
bin/dosfstools
bin/btrfs/progs
{% endblock %}
