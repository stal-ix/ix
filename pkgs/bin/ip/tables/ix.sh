{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
iptables
{% endblock %}

{% block version %}
1.8.12
{% endblock %}

{% block git_repo %}
https://git.netfilter.org/iptables
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
9eb2a01f898f52b35bc68a2145ffdd648f6195012e7619ddd159dd350d8a807b
{% endblock %}

{% block bld_libs %}
lib/c
lib/pcap
lib/nft/nl
lib/kernel
lib/nfnetlink
{% endblock %}

{% block cpp_defines %}
__UAPI_DEF_ETHHDR=0
{% endblock %}
