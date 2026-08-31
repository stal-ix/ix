{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
shotman
{% endblock %}

{% block version %}
0.5.1
{% endblock %}

{% block cargo_url %}
https://git.sr.ht/~whynothugo/shotman/archive/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
945f9686e37e6918447887878ea7fcc0dce61af6ba0d87e771f5ed0efc6bd43b
{% endblock %}

{% block bld_libs %}
lib/xkb/common
{% endblock %}

{% block cargo_bins %}
shotman
{% endblock %}

{% block cargo_tool %}
bld/cargo/96
{% endblock %}
