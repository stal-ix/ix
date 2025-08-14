{% extends '//die/c/autorehell.sh' %}

{% block git_repo %}
git://git.netfilter.org/libnftnl
{% endblock %}

{% block version %}
1.3.0
{% endblock %}

{% block pkg_name %}
libnftnl
{% endblock %}

{% block git_branch %}
libnftnl-{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
283954ba6f718767d9850e8e53fa6ef4996dc8e79fee1b1dab5624e6e0ff6b27
{% endblock %}

{% block lib_deps %}
lib/c
lib/mnl
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
