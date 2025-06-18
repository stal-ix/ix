{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
cbindgen
{% endblock %}

{% block version %}
0.29.0
{% endblock %}

{% block cargo_url %}
https://github.com/mozilla/cbindgen/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
509378c91ae61793fd0ecadb1e3e9c06c29516adb8e44d4fedf2e7c0eccfd696
{% endblock %}

{% block cargo_bins %}
cbindgen
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
