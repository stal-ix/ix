{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/neovide/neovide/archive/refs/tags/0.12.2.tar.gz
{% endblock %}

{% block cargo_sha %}
cee800370d887c928d55d2883093a0ae1f3989307249b56e45ca3c0a5b42a959
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}
