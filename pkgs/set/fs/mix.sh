{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
bin/parted
bin/xfsprogs
bin/gptfdisk
bin/jfs/utils
bin/e2fsprogs
bin/dosfstools
bin/f2fs/tools
bin/exfat/progs
bin/btrfs/progs
{% endblock %}
