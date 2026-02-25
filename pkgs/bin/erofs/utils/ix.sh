{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
erofs-utils
{% endblock %}

{% block version %}
1.9
{% endblock %}

{% block fetch %}
https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/snapshot/erofs-utils-{{self.version().strip()}}.tar.gz
d1bc84b5d60bcae121a7f57ea97d4155189087e178f8127f30846d9f537c9d73
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
