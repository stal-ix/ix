{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
cbindgen
{% endblock %}

{% block version %}
0.29.2
{% endblock %}

{% block cargo_url %}
https://github.com/mozilla/cbindgen/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
35541b294bc1a5b1577df272b840ac426c9157f578fbb9baf428f9c76994b742
{% endblock %}

{% block cargo_bins %}
cbindgen
{% endblock %}

{% block setup_target_flags %}
{{super()}}
export CARGO_BUILD_JOBS=4
{% endblock %}

{% block cargo_tool %}
bld/cargo/91
{% endblock %}
