{% block version %}
5.0.0
{% endblock %}

{% block pkg_name %}
premake
{% endblock %}

{% block fetch %}
https://github.com/premake/premake-core/archive/refs/tags/v{{self.version().strip()}}.tar.gz
ed52d17463112d6b93bc6e34bb6e15c6332e1f313ad5259fdde60e270aa30aec
{% endblock %}
