{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/ikatson/rqbit/archive/refs/tags/v7.0.1.tar.gz
{% endblock %}

{% block cargo_sha %}
974cfa5fa83d3ad77873c6b1e691d2f86144ee1a3b87296f91707b44bded2cdb
{% endblock %}

{% block cargo_ver %}
v4
{% endblock %}

{% block cargo_refine %}
make webui-deps
{% endblock %}

{% block cargo_refine_tools %}
bld/npm
bld/make
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/npm
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/rqbit ${out}/bin/
{% endblock %}

{% block bld_libs %}
lib/openssl
{% endblock %}
