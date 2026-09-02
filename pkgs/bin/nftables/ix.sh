{% extends '//die/c/autorehell.sh' %}

{% block git_repo %}
https://git.netfilter.org/nftables
{% endblock %}

{% block version %}
1.1.7
{% endblock %}

{% block pkg_name %}
nftables
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
cdfb97ef83b0c3a9f239dea7333f62c6c7643419aad76de63b8794721e4b521b
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

{% block patch %}
sed -i 's/for ((i = 56; i >= 0; i-= 8)); do/for i in 56 48 40 32 24 16 8 0; do/' configure.ac
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
