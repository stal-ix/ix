{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
erofs-utils
{% endblock %}

{% block version %}
1.8.10
{% endblock %}

{% block fetch %}
https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/snapshot/erofs-utils-{{self.version().strip()}}.tar.gz
05eb4edebe11decce6ecb34e98d2f80c8cd283c2f2967d8ba7efd58418570514
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
