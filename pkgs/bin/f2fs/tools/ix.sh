{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/snapshot/f2fs-tools-1.15.0.tar.gz
sha:147d471040b44900283ce2c935f1d35d13d7f40008e7cb8fab2b69f54da01a4f
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
lib/e2fsprogs
lib/bsd/overlay
{% endblock %}

{% block cpp_defines %}
aligned_alloc=memalign
{% endblock %}
