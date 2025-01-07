{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/ikatson/rqbit/archive/refs/tags/v8.0.0.tar.gz
{% endblock %}

{% block cargo_sha %}
df840031e02c12de33e8ec3a50d916404fe7b6d30e560de95b4d16c6f6d070aa
{% endblock %}

{% block cargo_ver %}
v4
{% endblock %}

{% block cargoc_ver %}
83
{% endblock %}

{% block cargo_refine %}
make webui-deps
(
cd crates/librqbit/webui
npm i @rollup/rollup-linux-x64-musl
)
(
cd desktop
npm i @rollup/rollup-linux-x64-musl
)
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
