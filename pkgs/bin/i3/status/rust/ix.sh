{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
i3status-rust
{% endblock %}

{% block version %}
0.40.0
{% endblock %}

{% block cargo_url %}
https://github.com/greshake/i3status-rust/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
a761ef5355636f9f6f33e96725218d8a780b97d8773facbecd3d015285c649ad
{% endblock %}

{% block bld_libs %}
lib/sensors
lib/openssl
lib/linux/headers
{% endblock %}

{% block host_libs %}
{{super()}}
lib/llvm/19
{% endblock %}

{% block bld_tool %}
bld/git
bld/make
bld/cmake
bld/rust/helpers/patch/bindgen
{% endblock %}

{% block patch %}
{{super()}}
patch_bindgen vendored
sed -e 's|"runtime"|"static"|' -i vendored/boring-sys/Cargo.toml
{% endblock %}

{% block setup_target_flags %}
{{super()}}
export BORING_BSSL_RUST_CPPLIB=c++
{% endblock %}

{% block cargo_features %}
{% endblock %}

{% block cargo_bins %}
i3status-rs
{% endblock %}

{% block cargo_tool %}
bld/rust/96
{% endblock %}
