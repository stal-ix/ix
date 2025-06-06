{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
tailspin
{% endblock %}

{% block version %}
5.4.4
{% endblock %}

{% block cargo_url %}
https://github.com/bensadeh/tailspin/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
40c773cb626a77b67dd9df81f2d12d95e9f2fa3d2bc547f4d5fab6bd0960bb08
{% endblock %}

{% block cargo_bins %}
tspin
{% endblock %}

{% block cargoc_ver %}
bld/cargo/86
{% endblock %}

{% block rustc_ver %}
86
{% endblock %}
