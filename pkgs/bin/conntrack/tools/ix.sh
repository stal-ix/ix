{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
conntrack-tools
{% endblock %}

{% block version %}
1.4.8
{% endblock %}

{% block git_repo %}
git://git.netfilter.org/conntrack-tools
{% endblock %}

{% block git_branch %}
conntrack-tools-{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
2c66f6c2b6658ebe5d67b9217f84693ce56a88a591ac23cca702a2f621d7e89c
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
