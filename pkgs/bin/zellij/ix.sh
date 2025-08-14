{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
zellij
{% endblock %}

{% block version %}
0.43.1
{% endblock %}

{% block cargo_url %}
https://github.com/zellij-org/zellij/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
c3febff26619ebfe614a8f45a2b1df46b3d07b5f17ea1256be553cf4ba53ad75
{% endblock %}

{% block bld_libs %}
lib/curl
lib/openssl
{% endblock %}

{% block cargo_bins %}
zellij
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
