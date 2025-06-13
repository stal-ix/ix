{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
f2fs-tools
{% endblock %}

{% block version %}
1.16.0
{% endblock %}

{% block fetch %}
https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/snapshot/f2fs-tools-{{self.version().strip()}}.tar.gz
208c7a07e95383fbd7b466b5681590789dcb41f41bf197369c41a95383b57c5e
{% endblock %}

{% block bld_libs %}
lib/c
lib/lz4
lib/kernel
lib/e2fsprogs
lib/bsd/overlay
{% endblock %}

{% block cpp_defines %}
aligned_alloc=memalign
{% endblock %}
