{% extends '//aux/fetch/ix.sh' %}

{% set fname %}cargo_{{parent_id}}.tar.lz4{% endset %}

{% block bld_tool %}
bld/rust
aux/ca/bundle
{{super()}}
{% endblock %}

{% block build %}
export SSL_CERT_FILE=${CA_BUNDLE}
export CARGO_HOME=${tmp}/crg
mkdir -p .cargo
cargo vendor vendored >> .cargo/config.toml
find . -name '*.a' -type f -delete
{% endblock %}
