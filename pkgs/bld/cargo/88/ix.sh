{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
cargo
{% endblock %}

{% block version %}
0.88.0
{% endblock %}

{% block cargo_url %}
https://github.com/rust-lang/cargo/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
e8636cc371c845c797d29bf7fe06c0e6273aa6579786f9c0426fb54f3d735726
{% endblock %}

{% block bld_libs %}
lib/curl
lib/git/2
{% endblock %}

{% block cargo_bins %}
cargo
{% endblock %}

{% block cargo_tool %}
bld/rust/86
{% endblock %}
