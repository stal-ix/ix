{% extends '//die/c/ix.sh' %}

{% block use_network %}true{% endblock %}

{% block std_box %}
bld/rust
aux/ca/bundle
{{super()}}
{% endblock %}

{% block setup %}
export CARGO_BUILD_JOBS=${make_thrs}
export CARGO_INSTALL_ROOT=${out}
export CARGO_HOME=${tmp}/obj
export SSL_CERT_FILE=${CA_BUNDLE}
{% endblock %}

{% set cargo_options %}
{% block cargo_options %}
{% endblock %}
{% endset %}

{% block build %}
cargo build --release {{ix.fix_list(cargo_options)}}
{% endblock %}

{% block install %}
cargo install --path .
{% endblock %}
