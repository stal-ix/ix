{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libnetfilter_conntrack
{% endblock %}

{% block version %}
1.1.1
{% endblock %}

{% block git_repo %}
git://git.netfilter.org/libnetfilter_conntrack
{% endblock %}

{% block git_branch %}
libnetfilter_conntrack-{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
4556744b45b5b666d2ba3845902d3b729c974f8f977795d8eb7d2f2eca6e839b
{% endblock %}

{% block lib_deps %}
lib/c
lib/mnl
lib/nfnetlink
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
