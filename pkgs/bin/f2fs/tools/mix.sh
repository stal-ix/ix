{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/snapshot/f2fs-tools-1.14.0.tar.gz
sha:619263d4e2022152a1472c1d912eaae104f20bd227ce0bb9d41d1d6608094bd1
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
bin/e2fsprogs
lib/bsd/overlay
{% endblock %}

{% block cpp_defines %}
aligned_alloc=memalign
{% endblock %}
