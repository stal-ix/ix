{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
conntrack-tools
{% endblock %}

{% block version %}
1.4.9
{% endblock %}

{% block fetch %}
https://www.netfilter.org/projects/conntrack-tools/files/conntrack-tools-{{self.version().strip()}}.tar.xz
c15afe488a8d408c9d6d61e97dbd19f3c591942f62c13df6453a961ca4231cae
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
