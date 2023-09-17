{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://static.rust-lang.org/dist/rustc-1.54.0-src.tar.gz
sha:ac8511633e9b5a65ad030a1a2e5bdaa841fdfe3132f2baaa52cc04e71c6c6976
{% endblock %}

{% block bld_tool %}
bin/mrustc/boot
{% endblock %}

{% block build %}
cargo build -p compiler/rustc
{% endblock %}
