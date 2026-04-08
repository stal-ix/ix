{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
bandwhich
{% endblock %}

{% block version %}
0.23.1
{% endblock %}

{% block cargo_url %}
https://github.com/imsnif/bandwhich/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
07a6e473d1ebae3fc934b117790b73c4af58731cc969e4aee8e6cd9842cbc520
{% endblock %}

{% block cargo_bins %}
bandwhich
{% endblock %}

{% block cargo_tool %}
bld/cargo/91
{% endblock %}
