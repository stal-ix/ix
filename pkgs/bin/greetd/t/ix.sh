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
81d4868cfef5068406c5dfc41c868b5c4a3984b64df3c53a44246e46df5694f7
{% endblock %}

{% block cargo_tool %}
bld/cargo/91
{% endblock %}
