{% extends '//die/c/autorehell.sh' %}

{% block git_repo %}
https://git.netfilter.org/nftables
{% endblock %}

{% block version %}
1.1.6
{% endblock %}

{% block pkg_name %}
nftables
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
d2a13eb222c49561f58c093ccb297c5150e92b11b58b86f97389b0bc28029655
{% endblock %}

{% block bld_libs %}
lib/c
lib/gmp
lib/mnl
lib/edit
lib/nft/nl
lib/kernel
lib/jansson
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
bld/fake(tool_name=a2x)
{% endblock %}

{% block configure_flags %}
--with-json
{% endblock %}

{% block build %}
{{super()}}
>doc/libnftables.3
>doc/libnftables-json.5
>doc/nft.8
{% endblock %}
