{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/snapshot/erofs-utils-1.8.tar.gz
sha:117f9e5d9411e8188abb6bf77d9fa967291f60a9ee65f3dcb8e9f88e5307afdf
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/lz4
lib/zstd
lib/fuse/2
lib/kernel
lib/linux/util
{% endblock %}
