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
78bf3b2819083df2927b36070fa889e98154beb7fd74829e3130cb2b35ff7fe7
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
