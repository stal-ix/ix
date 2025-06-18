{% block pkg_name %}
bcachefs-tools
{% endblock %}

{% block version %}
1.25.2
{% endblock %}

{% block http_sha %}
47a82e7f4199a75b6649face84c0a2f61ec9c0bb59b6ffdd3b2a1904d9909be4
{% endblock %}

{% block cargo_url %}
https://github.com/koverstreet/bcachefs-tools/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
84d0478604748ea9d3a824ef304501efb3b08b215733d2f3439d6a0ce0cf8e0f
{% endblock %}
