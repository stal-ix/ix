{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
eza
{% endblock %}

{% block version %}
0.22.0
{% endblock %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
dd7c740436ac1dc3b808834ad64dd2657f079ebe376808e1ae4a288cd841cdcf
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block cargo_bins %}
eza
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
