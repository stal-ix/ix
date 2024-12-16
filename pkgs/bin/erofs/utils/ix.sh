{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/snapshot/erofs-utils-1.8.3.tar.gz
sha:3c5cc03603ea08ba9ae5e0420eeaea5ff17ed29e2280685310356cbf25304e85
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
