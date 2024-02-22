{% extends '//die/rust/cargo_v2.sh' %}

{% block cargo_url %}
https://github.com/neovide/neovide/archive/refs/tags/0.12.2.tar.gz
{% endblock %}

{% block cargo_sha %}
46ceea9523529e4517e39f7e24150456f885aa0ae07b390c94896001a3f94e32
{% endblock %}

{#
  thread 'main' panicked at /home/pg/ix_root/build/37m8XIDm1cIvw2Fo/src/vendored/skia-bindings/build_support/binary_cache/download.rs:28:10:
  called `Result::unwrap()` on an `Err` value: Os { code: 2, kind: NotFound, message: "No such file or directory" }
#}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}
