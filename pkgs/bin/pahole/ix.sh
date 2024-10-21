{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://git.kernel.org/pub/scm/devel/pahole/pahole.git
{% endblock %}

{% block git_branch %}
v1.27
{% endblock %}

{% block git_sha %}
0e4f89e35e6ce256a6716305662598cac815245f275b57b0f64e58d929c86852
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
