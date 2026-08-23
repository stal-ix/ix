{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
conntrack-tools
{% endblock %}

{% block version %}
1.4.9
{% endblock %}

{% block git_repo %}
git://git.netfilter.org/conntrack-tools
{% endblock %}

{% block git_branch %}
conntrack-tools-{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
4866ff12768f5ecc9b1af92259c4045cbe80deb84e1cd24e9a4642d0ee96b7f2
{% endblock %}

{% block bld_libs %}
lib/c
lib/tirpc
lib/kernel
lib/net/filter
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}
