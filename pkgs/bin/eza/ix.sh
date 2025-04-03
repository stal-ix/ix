{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.21.0.tar.gz
{% endblock %}

{% block cargo_sha %}
836f56cdd9dfe4d96eb37108f27d886e540d81ea0f9a2f2ba97736fe5fcc4979
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block cargo_bins %}
eza
{% endblock %}
