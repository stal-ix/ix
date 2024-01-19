{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/uutils/coreutils/archive/refs/tags/0.0.23.tar.gz
{% endblock %}

{% block cargo_sha %}
7b294dc2b66fb6338cbe5ff53e8c412b6a066f19b23c156b4b7afed08a200282
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/iconv
{% endblock %}
