{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libnetfilter_conntrack
{% endblock %}

{% block version %}
1.1.0
{% endblock %}

{% block git_repo %}
git://git.netfilter.org/libnetfilter_conntrack
{% endblock %}

{% block git_branch %}
libnetfilter_conntrack-{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
260dacf58b18f9661fd67b62ae13af09f53244e1968b145fefb76407b7f43dbd
{% endblock %}

{% block lib_deps %}
lib/c
lib/mnl
lib/nfnetlink
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
