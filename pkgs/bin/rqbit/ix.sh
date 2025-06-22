{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
rqbit
{% endblock %}

{% block version %}
8.0.0
{% endblock %}

{% block cargo_url %}
https://github.com/ikatson/rqbit/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
broken
{% endblock %}

{% block cargo_ver %}
v4
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}

{% block cargo_refine %}
make webui-deps
(
cd crates/librqbit/webui
npm install --save --save-exact rollup@npm:@rollup/wasm-node
)
{% endblock %}

{% block cargo_refine_tools %}
bld/npm
bld/make
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/npm
bld/de/bloat
bin/esbuild/21
{% endblock %}

{% block cargo_bins %}
rqbit
{% endblock %}

{% block bld_libs %}
lib/openssl
{% endblock %}

{% block patch %}
find . -name esbuild -type f | while read l; do
    echo > ${l}
done
debloat ${PWD}
find . -name esbuild -type f | while read l; do
    rm ${l}
    cp $(command -v esbuild) ${l}
done
{% endblock %}
