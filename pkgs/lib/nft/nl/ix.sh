{% extends '//die/c/autorehell.sh' %}

{% block git_repo %}
git://git.netfilter.org/libnftnl
{% endblock %}

{% block version %}
1.3.1
{% endblock %}

{% block pkg_name %}
libnftnl
{% endblock %}

{% block git_branch %}
libnftnl-{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
adf95504184ef06a512e982d921a106319424d10657d2bd6d12b59235722d79d
{% endblock %}

{% block lib_deps %}
lib/c
lib/mnl
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
