{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/JakeStanger/ironbar/archive/refs/tags/v0.15.1.tar.gz
{% endblock %}

{% block cargo_sha %}
38e6f763426123b6a00663cf9a554f8fbe0f12115a7175d8a21830653a05ce9c
{% endblock %}

{% block bld_libs %}
lib/lua
lib/atk
lib/gtk
lib/glib
lib/openssl
lib/gtk/layer/shell
{% endblock %}

{% block patch %}
sed -e 's|.*"volume".*||' -i Cargo.toml
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/ironbar ${out}/bin/
{% endblock %}
