{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
greetd
{% endblock %}

{% block version %}
0.10.3
{% endblock %}

{% block cargo_url %}
https://git.sr.ht/~kennylevinsen/greetd/archive/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
929c2ce96ff640c9feb1a9cec94458f5171daaa6c0bedb7eb5b2c559e1de35ca
{% endblock %}

{% block cargo_tool %}
bld/cargo/91
{% endblock %}
