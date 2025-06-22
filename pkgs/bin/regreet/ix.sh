{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
ReGreet
{% endblock %}

{% block version %}
0.2.0
{% endblock %}

{% block cargo_url %}
https://github.com/rharish101/ReGreet/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
83f27ae53e2fdbe42607de896917cac399aba6b3ecc12c1b70e557f4ea365e01
{% endblock %}

{% block bld_libs %}
lib/gtk/4
{% endblock %}

{% block cargo_bins %}
regreet
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
