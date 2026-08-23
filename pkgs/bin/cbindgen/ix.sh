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
81d4868cfef5068406c5dfc41c868b5c4a3984b64df3c53a44246e46df5694f7
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
