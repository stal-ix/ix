{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
tailspin
{% endblock %}

{% block version %}
5.4.3
{% endblock %}

{% block cargo_url %}
https://github.com/bensadeh/tailspin/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
96bbd6626388a0ad32d857e6b9d2b7b46037b88ecf11de56d147db94688dae73
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
