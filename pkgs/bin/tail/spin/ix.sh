{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
tailspin
{% endblock %}

{% block version %}
7.0.0
{% endblock %}

{% block cargo_url %}
https://github.com/bensadeh/tailspin/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
737ce20389977de2002ee95c0ef486f657b8da68b796e625284f6b34eb9977d7
{% endblock %}

{% block cargo_bins %}
tspin
{% endblock %}

{% block cargo_tool %}
bld/cargo/96
{% endblock %}
