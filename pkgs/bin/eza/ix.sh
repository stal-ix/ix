{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
eza
{% endblock %}

{% block version %}
0.23.3
{% endblock %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
91405d8bca0c118d12463953e8f8bd4ab6e23f78f69cb4a98cab8101d7fd4666
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block cargo_bins %}
eza
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
