{% extends '//die/c/autorehell.sh' %}

{% block git_repo %}
https://git.netfilter.org/iptables
{% endblock %}

{% block git_branch %}
v1.8.11
{% endblock %}

{% block git_sha %}
b99b603ff20cd976ba9181034ffbd130e702b3e4601e71caf7b89346efefbe3d
{% endblock %}

{% block bld_libs %}
lib/c
lib/nft/nl
lib/kernel
lib/nfnetlink
{% endblock %}

{% block cpp_defines %}
__UAPI_DEF_ETHHDR=0
{% endblock %}
