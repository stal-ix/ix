{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/neovide/neovide/archive/refs/tags/0.12.2.tar.gz
{% endblock %}

{% block cargo_sha %}
1738020d1b9ac868b395e5db6b8241501e538a69f7f2d22c02be440ccf33cb55
{% endblock %}

{#
  thread 'main' panicked at /home/pg/ix_root/build/37m8XIDm1cIvw2Fo/src/vendored/skia-bindings/build_support/binary_cache/download.rs:28:10:
  called `Result::unwrap()` on an `Err` value: Os { code: 2, kind: NotFound, message: "No such file or directory" }
#}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}
