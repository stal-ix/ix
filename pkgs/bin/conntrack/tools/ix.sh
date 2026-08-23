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
b21600339b33ff676d571faa0bdeee3424e019b9fcc33ab9c0d13fee8fcb12bc
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
