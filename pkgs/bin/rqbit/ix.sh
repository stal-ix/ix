{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/ikatson/rqbit/archive/refs/tags/v7.0.1.tar.gz
{% endblock %}

{% block cargo_sha %}
8e48523b50ee55629bf0edf6cb66237701b9e3eab456ec1e418fe9fce2a52cc8
{% endblock %}

{% block cargo_ver %}
v4
{% endblock %}

{% block cargo_refine %}
(
cd desktop
npm install
)
(
cd crates/librqbit/webui
npm install
npm run build
)
{% endblock %}

{% block cargo_refine_tools %}
bld/npm
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/pzd/des
bld/fake(tool_name=npm)
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/rqbit ${out}/bin/
{% endblock %}

{% block bld_libs %}
lib/openssl
{% endblock %}
