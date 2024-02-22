{% extends '//die/rust/cargo_v2.sh' %}

{% block cargo_url %}
https://github.com/neovide/neovide/archive/refs/tags/0.12.2.tar.gz
{% endblock %}

{% block cargo_sha %}
46ceea9523529e4517e39f7e24150456f885aa0ae07b390c94896001a3f94e32
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}
