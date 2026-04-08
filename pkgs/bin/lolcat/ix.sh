{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
lolcat
{% endblock %}

{% block version %}
1.3.1
{% endblock %}

{% block cargo_url %}
https://github.com/ur0/lolcat/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
8ce4db8c1725b7647917c9edc18a6f80190f2a045babbe563ae8cb7cd1abfdbb
{% endblock %}

{% block cargo_bins %}
lolcat
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
