{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
eza
{% endblock %}

{% block version %}
0.21.0
{% endblock %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v{{self.version().strip()}}.tar.gz
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
