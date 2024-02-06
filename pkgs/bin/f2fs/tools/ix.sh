{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/snapshot/f2fs-tools-1.16.0.tar.gz
sha:208c7a07e95383fbd7b466b5681590789dcb41f41bf197369c41a95383b57c5e
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/e2fsprogs
lib/bsd/overlay
{% endblock %}

{% block cpp_defines %}
aligned_alloc=memalign
{% endblock %}

{% block setup_target_flags %}
export ac_cv_func_lseek64=yes
{% endblock %}
