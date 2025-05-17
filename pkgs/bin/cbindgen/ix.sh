{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
cbindgen
{% endblock %}

{% block version %}
0.28.0
{% endblock %}

{% block cargo_url %}
https://github.com/mozilla/cbindgen/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
ddd795eeb621f11bf48d24c64fdff8c2214956202e0273268ba2be561d3dfe49
{% endblock %}

{% block cargo_bins %}
cbindgen
{% endblock %}
