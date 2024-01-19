{% extends '//aux/fetch/ix.sh' %}

{% set fname %}cargo_{{parent_id}}.tar.lz4{% endset %}

{% block bld_tool %}
bld/rust
{{super()}}
{% endblock %}

{% block build %}
export CARGO_HOME=${PWD}/vendored
cargo fetch
{% endblock %}
