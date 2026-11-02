{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
eza
{% endblock %}

{% block version %}
0.23.5
{% endblock %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
0690776f5126499860e0f80af68632f292b03740b9ebeb7e841e6f6adad114e6
{% endblock %}

{% block cargo_ver %}
v4
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block cargo_bins %}
eza
{% endblock %}

{% block cargo_tool %}
bld/cargo/91
{% endblock %}
