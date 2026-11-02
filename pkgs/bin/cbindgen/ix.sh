{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
cbindgen
{% endblock %}

{% block version %}
0.29.4
{% endblock %}

{% block cargo_url %}
https://github.com/mozilla/cbindgen/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
d73cb8389e6a75bed858db24df1ba696fb4ee3a2504c4fde571329d418a4a362
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
