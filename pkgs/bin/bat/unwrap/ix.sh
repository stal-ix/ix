{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
bat
{% endblock %}

{% block version %}
0.26.0
{% endblock %}

{% block cargo_url %}
https://github.com/sharkdp/bat/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
e5c01be77390fe629674c2baf70cb6fdc5d83460ccc3a513974348bf68e67e9a
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/iconv
lib/git/2
lib/oniguruma
{% endblock %}

{% block cargo_bins %}
bat
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
