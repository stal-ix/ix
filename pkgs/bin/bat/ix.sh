{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/sharkdp/bat/archive/refs/tags/v0.24.0.tar.gz
{% endblock %}

{% block cargo_sha %}
e316db4a974749a8b8d8495b026c47e7c67b3a5864fe3e50f5d70658d44b01f6
{% endblock %}

{% block bld_libs %}
lib/c
lib/iconv
{% endblock %}
