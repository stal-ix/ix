{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
ironbar
{% endblock %}

{% block version %}
f125058e7955891b5d0649eee8d8d28a6130a465
{% endblock %}

{% block cargo_url %}
https://github.com/JakeStanger/ironbar/archive/{{self.version().strip()}}.zip
{% endblock %}

{% block cargo_sha %}
78ef18ff10515ee725da610143eb3b396409194adc5ab4258e79408f0435d9ae
{% endblock %}

{% block bld_libs %}
lib/lua
lib/atk
lib/gtk
lib/glib
lib/udev
lib/input
lib/openssl
lib/dbus/menu
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
bld/cargo/86
{% endblock %}
