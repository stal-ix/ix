{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
erofs-utils
{% endblock %}

{% block version %}
1.9.4
{% endblock %}

{% block fetch %}
https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/snapshot/erofs-utils-{{self.version().strip()}}.tar.gz
7d135aa2550326a5acf20f53c518aea5a8900015ce50700044e40f818c31dd80
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
