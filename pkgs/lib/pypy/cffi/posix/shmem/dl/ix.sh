{% extends '//lib/pypy/cffi/t/dl.sh' %}

{% include '//lib/pypy/cffi/posix/shmem/mod.sh' %}

{% block lib_deps %}
lib/pypy/cffi/posix/shmem
{% endblock %}
