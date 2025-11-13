{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
pahole
{% endblock %}

{% block version %}
1.31
{% endblock %}

{% block git_repo %}
https://git.kernel.org/pub/scm/devel/pahole/pahole.git
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
55d5077bc7a5aff11de10b0f8674c964a03e1f3b236ab4ad54406a6cf7c5026e
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
