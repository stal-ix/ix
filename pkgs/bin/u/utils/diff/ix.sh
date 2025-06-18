{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
diffutils
{% endblock %}

{% block version %}
0.4.2
{% endblock %}

{% block cargo_url %}
https://github.com/uutils/diffutils/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
d4905302fb0337c2089c6bc1c2a12c11db7bac60fab9207987a76197d3c2fd76
{% endblock %}

{% block cargo_bins %}
diffutils
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
