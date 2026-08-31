{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
microsoft-edit
{% endblock %}

{% block version %}
2.0.0
{% endblock %}

{% block cargo_url %}
https://github.com/microsoft/edit/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
0052cfb2fd5aef7e94a9b166d855c7483b57daf7ede3ad60798c0c620fffcce7
{% endblock %}

{% block cargo_bins %}
edit
{% endblock %}

{% block cargo_tool %}
bld/cargo/96
{% endblock %}

{% block bld_libs %}
lib/icu/dl
{% endblock %}
