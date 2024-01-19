{% extends '//die/rust/cargo2.sh' %}

{% block cargo_url %}
https://github.com/sharkdp/bat/archive/refs/tags/v0.24.0.tar.gz
{% endblock %}

{% block cargo_sha %}
a62f2e98f70b352a32809dbfe8d0ecb42d9e83d9912eebd7f7d2537597cf04fb
{% endblock %}

{% block bld_libs %}
lib/c
lib/iconv
{% endblock %}
