{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
xh
{% endblock %}

{% block version %}
0.25.3
{% endblock %}

{% block cargo_url %}
https://github.com/ducaale/xh/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
4d0e1512be65c1bb01237fe6855b07be0918cf1b49a0787e39799c90851b873b
{% endblock %}

{% block bld_libs %}
lib/c
lib/oniguruma
{% endblock %}

{% block cargo_features %}
rustls
{% endblock %}

{% block cargo_bins %}
xh
{% endblock %}

{% block cargo_tool %}
bld/cargo/91
{% endblock %}
