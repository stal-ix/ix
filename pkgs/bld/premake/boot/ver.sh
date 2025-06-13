{% block version %}
5.0.0-beta6
{% endblock %}

{% block pkg_name %}
premake
{% endblock %}

{% block fetch %}
https://github.com/premake/premake-core/archive/refs/tags/v{{self.version().strip()}}.tar.gz
b46990b80aaa9e8f84ed628f179dfa55d1bae40de1be1239d7b27b22fa838989
{% endblock %}
