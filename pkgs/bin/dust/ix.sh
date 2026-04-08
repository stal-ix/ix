{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
du-dust
{% endblock %}

{% block version %}
1.2.4
{% endblock %}

{% block cargo_url %}
https://github.com/bootandy/dust/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
5848fbd4c1251336402982ea6ee0212749136a59f069d9d24099326484167302
{% endblock %}

{% block cargo_bins %}
dust
{% endblock %}

{% block cargo_tool %}
bld/cargo/91
{% endblock %}
