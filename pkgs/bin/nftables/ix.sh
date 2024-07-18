{% extends '//die/c/autorehell.sh' %}

{% block git_repo %}
git://git.netfilter.org/nftables
{% endblock %}

{% block git_branch %}
v1.1.0
{% endblock %}

{% block git_sha %}
55c108bfb936a7569c0d637084c17b75c3285321c6fac441c3c9990a589fe1c9
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
