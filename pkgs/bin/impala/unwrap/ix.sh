{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
impala
{% endblock %}

{% block version %}
0.7.4
{% endblock %}

{% block cargo_url %}
https://github.com/pythops/impala/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
e245a21979628faf84cf433a71186acd6d536e2279768919e150a42dd402246e
{% endblock %}

{% block cargo_bins %}
impala
{% endblock %}

{% block cargo_tool %}
bld/cargo/91
{% endblock %}
