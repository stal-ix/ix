{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
pahole
{% endblock %}

{% block version %}
1.30
{% endblock %}

{% block git_repo %}
https://git.kernel.org/pub/scm/devel/pahole/pahole.git
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
d1aefe5026c38e3fc6c6da0d6f96777e4cb9e6d82165124ed307454bdf6e3860
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
