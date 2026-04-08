{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
ripgrep
{% endblock %}

{% block version %}
14.1.1
{% endblock %}

{% block cargo_url %}
https://github.com/BurntSushi/ripgrep/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
771395c43ed19a170608489296e63964b9ea8ee5d4b608347da1891ff6bf319a
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
bld/cargo/86
{% endblock %}
