{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
gitui
{% endblock %}

{% block version %}
0.28.0
{% endblock %}

{% block cargo_url %}
https://github.com/extrawurst/gitui/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
991936f06dfcd4b44c1f328a9af95018f97229df3a6bfcacc3949eb333759325
{% endblock %}

{% block bld_libs %}
lib/c
lib/iconv
lib/git/2
lib/openssl
lib/oniguruma
lib/z/ng/native
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/make
bld/cmake
bld/fakegit
{% endblock %}

{% block cargo_bins %}
gitui
{% endblock %}

{% block patch %}
{{super()}}
rust_remove_c vendored/libz-ng-sys
{% endblock %}

{% block cargo_tool %}
bld/cargo/91
{% endblock %}
