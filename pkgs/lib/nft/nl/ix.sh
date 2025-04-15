{% extends '//die/c/autorehell.sh' %}

{% block git_repo %}
git://git.netfilter.org/libnftnl
{% endblock %}

{% block version %}
1.2.9
{% endblock %}

{% block pkg_name %}
libnftnl
{% endblock %}

{% block git_branch %}
libnftnl-{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
0bb3ea8d7108e4b8377c27c343a7484a7fb9fab45fed72ad7ee57eb58e4b2a23
{% endblock %}

{% block lib_deps %}
lib/c
lib/mnl
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
