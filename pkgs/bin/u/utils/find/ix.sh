{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
findutils
{% endblock %}

{% block version %}
0.7.0
{% endblock %}

{% block cargo_url %}
https://github.com/uutils/findutils/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
c67b91720693697048489f8bbd4e243f74dda841d4ce58a76401f309b98a180a
{% endblock %}

{% block bld_libs %}
lib/oniguruma
{% endblock %}

{% block cargo_bins %}
find
xargs
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
