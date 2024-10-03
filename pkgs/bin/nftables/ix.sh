{% extends '//die/c/autorehell.sh' %}

{% block git_repo %}
git://git.netfilter.org/nftables
{% endblock %}

{% block git_branch %}
v1.1.1
{% endblock %}

{% block git_sha %}
d79d1e76b4e6ee69edf41bdd33a382b52b0055984ad66e9498b735420f8b616e
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
