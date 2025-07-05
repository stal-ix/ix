{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
just
{% endblock %}

{% block version %}
1.41.0
{% endblock %}

{% block cargo_url %}
https://github.com/casey/just/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
a79cbfcb9f1b39ce62188dd09f70c4e2f3f7fcc54ef79e2fe401ac65b2dd8b7a
{% endblock %}

{% block cargo_bins %}
just
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
