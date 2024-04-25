{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/mdadm
bin/parted
bin/xfsprogs
bin/gptfdisk
bin/jfs/utils
bin/e2fsprogs
bin/dosfstools
bin/f2fs/tools
bin/util/wipefs
bin/exfat/progs
bin/btrfs/progs
bin/bcache/tools
bin/bcache/fs/tools
{% endblock %}
