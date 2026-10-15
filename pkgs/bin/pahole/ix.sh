{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
pahole
{% endblock %}

{% block version %}
1.32
{% endblock %}

{% block git_repo %}
https://git.kernel.org/pub/scm/devel/pahole/pahole.git
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
88de20e8cda4b829f3a1139890ac17f2beb2abe6c9b4a8de45524779c0801815
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
