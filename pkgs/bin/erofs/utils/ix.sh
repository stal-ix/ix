{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
erofs-utils
{% endblock %}

{% block version %}
1.8.9
{% endblock %}

{% block fetch %}
https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/snapshot/erofs-utils-{{self.version().strip()}}.tar.gz
145a6f7fe4941814d30099c3568448d37c819ccd030fc5bfbcaab21134e6176e
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
