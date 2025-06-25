{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
microsoft-edit
{% endblock %}

{% block version %}
1.2.0
{% endblock %}

{% block cargo_url %}
https://github.com/microsoft/edit/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
ca088e62f30e077c0590d1edd59ba3dd1fb5c5ab292fe0438582f1133a424f07
{% endblock %}

{% block cargo_bins %}
edit
{% endblock %}

{% block cargo_tool %}
bld/cargo/87
{% endblock %}

{% block build %}
export RUSTC_BOOTSTRAP=1
{{super()}}
{% endblock %}

{% block bld_libs %}
lib/icu/dl
{% endblock %}
