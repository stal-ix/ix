{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
ironbar
{% endblock %}

{% block version %}
0.16.1
{% endblock %}

{% block cargo_url %}
https://github.com/JakeStanger/ironbar/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
012add37012d127b7d95b84d6b33f9df23ced30e8509a63de5b8a0896084071c
{% endblock %}

{% block bld_libs %}
lib/lua
lib/atk
lib/gtk
lib/glib
lib/openssl
lib/gtk/layer/shell/3
{% endblock %}

{% block patch %}
sed -e 's|.*"volume".*||' -i Cargo.toml
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/ironbar ${out}/bin/
{% endblock %}

{% block cargo_tool %}
bld/cargo/75
{% endblock %}
