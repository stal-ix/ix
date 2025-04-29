{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
tailspin
{% endblock %}

{% block version %}
5.4.2
{% endblock %}

{% block cargo_url %}
https://github.com/bensadeh/tailspin/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
fa6327a86e652ff6d8d1019c6fe7f03f12f9c30f005f46e2039ffc102298a045
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
