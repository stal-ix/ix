{% block version %}
5.0.0-beta2
{% endblock %}

{% block pkg_name %}
premake
{% endblock %}

{% block fetch %}
https://github.com/premake/premake-core/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:84a7775fe0a90c0f649eb18b10779b84626ad8c58dea4a8f24cca83690dd47d4
{% endblock %}
