{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://git.kernel.org/pub/scm/devel/pahole/pahole.git
{% endblock %}

{% block git_branch %}
v1.27
{% endblock %}

{% block git_sha %}
3c73b57fe2e54901a0c6f64252ab89bfaf074298417fa22d1cd1723de022ed67
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/bpf
lib/kernel
lib/obstack
lib/elfutils
lib/argp/standalone
{% endblock %}
