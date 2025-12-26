{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
bat
{% endblock %}

{% block version %}
0.26.1
{% endblock %}

{% block cargo_url %}
https://github.com/sharkdp/bat/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
b0b46e0f9d4c9bc4817c1051ea2cba763b103977349e2c503d91dbabb11a12d9
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
bld/cargo/91
{% endblock %}
