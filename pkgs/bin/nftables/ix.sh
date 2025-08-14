{% extends '//die/c/autorehell.sh' %}

{% block git_repo %}
git://git.netfilter.org/nftables
{% endblock %}

{% block version %}
1.1.4
{% endblock %}

{% block pkg_name %}
nftables
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
e8aa32516cb572dca3d6728afac4ffc89de03538c681d0bf2288f5ba2b85070f
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
