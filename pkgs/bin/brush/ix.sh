{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
brush
{% endblock %}

{% block version %}
0.2.19
{% endblock %}

{% block cargo_url %}
https://github.com/reubeno/brush/archive/refs/tags/brush-shell-v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
00436d6c75415fdaeee58fcea192707c26672617c3e235a5d9e6c3e84906ae17
{% endblock %}

{% block cargo_bins %}
brush
{% endblock %}

{% block cargo_tool %}
bld/cargo/87
{% endblock %}
