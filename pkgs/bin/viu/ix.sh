{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
viu
{% endblock %}

{% block version %}
1.6.1
{% endblock %}

{% block cargo_url %}
https://github.com/atanunq/viu/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
c09f11f457c5f820de831fcfc7beaaeb6ce9db2367ee0f5f5e54039dd47f0d02
{% endblock %}

{% block patch %}
# zune-jpeg < 0.5.11: #[target_feature] on safe fn is error since Rust 1.85
sed -i 's/^pub fn /pub unsafe fn /' vendored/zune-jpeg/src/upsampler/avx2.rs
{% endblock %}

{% block cargo_bins %}
viu
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
