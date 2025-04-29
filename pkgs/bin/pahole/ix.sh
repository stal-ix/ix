{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
pahole
{% endblock %}

{% block version %}
1.29
{% endblock %}

{% block git_repo %}
https://git.kernel.org/pub/scm/devel/pahole/pahole.git
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
0d7e240e7bf3023344e37518ebae1986db96d5e99571ec6c6584bd262e43a646
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
