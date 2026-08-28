{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
gitui
{% endblock %}

{% block version %}
0.28.1
{% endblock %}

{% block cargo_url %}
https://github.com/extrawurst/gitui/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
81d4868cfef5068406c5dfc41c868b5c4a3984b64df3c53a44246e46df5694f7
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
