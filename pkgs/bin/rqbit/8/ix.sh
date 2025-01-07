{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/ikatson/rqbit/archive/refs/tags/v8.0.0.tar.gz
{% endblock %}

{% block cargo_sha %}
e34ab238ee69e589a53c84a5afb0cac27d66a825ebc38a7c8ee3821e6c125e7b
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
npm install --save --save-exact vite@4.5.3
npm install --save --save-exact rollup@3.29.0
)
(
cd desktop
npm install --save --save-exact vite@4.5.3
npm install --save --save-exact rollup@3.29.0
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

{% block patch %}
sed -e "s|manifestPath = .*|manifestPath = 'manifest.json';|" \
    -i crates/librqbit/webui/post-build
{% endblock %}
