{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
erofs-utils
{% endblock %}

{% block version %}
1.8.6
{% endblock %}

{% block fetch %}
https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/snapshot/erofs-utils-{{self.version().strip()}}.tar.gz
sha:5b221dc3fd6d151425b30534ede46fb7a90dc233a8659cba0372796b0a066547
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
