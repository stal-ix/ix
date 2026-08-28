{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
iptables
{% endblock %}

{% block version %}
1.8.13
{% endblock %}

{% block git_repo %}
https://git.netfilter.org/iptables
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
d14d9f8c2b063ed6b22b29ffdbc558e2a6d2e51284426f20355abb1cb639d2ad
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
