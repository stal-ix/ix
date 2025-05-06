{% block pkg_name %}
bcachefs-tools
{% endblock %}

{% block version %}
1.25.2
{% endblock %}

{% block http_sha %}
sha:47a82e7f4199a75b6649face84c0a2f61ec9c0bb59b6ffdd3b2a1904d9909be4
{% endblock %}

{% block cargo_url %}
https://github.com/koverstreet/bcachefs-tools/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
1270b4c071ffb3754198fb7742e4854cdb20fc293b485bed9d7c86e084d0f18e
{% endblock %}
