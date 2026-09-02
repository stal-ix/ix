{% extends '//die/c/autorehell.sh' %}

{% block git_repo %}
https://git.netfilter.org/libnftnl
{% endblock %}

{% block version %}
1.3.2
{% endblock %}

{% block pkg_name %}
libnftnl
{% endblock %}

{% block git_branch %}
libnftnl-{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
34fc7e0cc384177a3a3e2f58c0b5dc0817a949b4c1e2f8b0f7b56b2babd3c030
{% endblock %}

{% block lib_deps %}
lib/c
lib/mnl
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
