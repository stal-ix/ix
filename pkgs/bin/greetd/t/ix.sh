{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
greetd
{% endblock %}

{% block version %}
0.9.0
{% endblock %}

{% block cargo_url %}
https://git.sr.ht/~kennylevinsen/greetd/archive/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
b85455ba2a558795c7e9b171122218520bcb0589268ea9bdb59fd27d1ed6d641
{% endblock %}
