{% extends '//die/c/autorehell.sh' %}

{% block version %}
1.8.4
{% endblock %}

{% block fetch %}
https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/snapshot/erofs-utils-{{self.version().strip()}}.tar.gz
sha:791587aa074bb9f9fa218c762cc1f60b015e2f51bcb2ce91f682f043856ab494
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
