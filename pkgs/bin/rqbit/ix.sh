{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/ikatson/rqbit/archive/refs/tags/v7.0.1.tar.gz
{% endblock %}

{% block cargo_sha %}
a7d08848a9de24789eddb4ae9798738a66cf2d7e0bb740823d5c08cbd81d9b50
{% endblock %}

{% block cargo_ver %}
v4
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/pzd/des
bld/fake(tool_name=npm)
{% endblock %}

{% block bld_data %}
{{super()}}
bin/rqbit/web
{% endblock %}

{% block build %}
mkdir www
cd www
des ${RQ_UI} .
cd ..
rm -rf desktop
mv www/desktop ./
rm -rf crates/librqbit/webui
mv www/webui crates/librqbit/
{{super()}}
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/rqbit ${out}/bin/
{% endblock %}

{% block bld_libs %}
lib/openssl
{% endblock %}
