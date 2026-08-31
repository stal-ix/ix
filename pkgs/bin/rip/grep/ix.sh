{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
ripgrep
{% endblock %}

{% block version %}
15.2.0
{% endblock %}

{% block cargo_url %}
https://github.com/BurntSushi/ripgrep/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
1278c0097afec6588636d7e1a08dc8c68365045753fa73798348826424f37a2b
{% endblock %}

{% block patch %}
sed -i '/\[target.*jemallocator\]/,/^$/d' Cargo.toml
sed -i '/jemallocator/d' Cargo.toml
sed -i '/#\[global_allocator\]/,/static ALLOC/d' crates/core/main.rs
sed -i '/jemallocator/d' crates/core/main.rs
{% endblock %}

{% block cargo_bins %}
rg
{% endblock %}

{% block cargo_tool %}
bld/cargo/96
{% endblock %}
