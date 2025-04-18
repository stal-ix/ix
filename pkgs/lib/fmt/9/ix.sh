{% extends '//lib/fmt/t/ix.sh' %}

# noauto

{% block pkg_name %}
fmt
{% endblock %}

{% block version %}
9.1.0
{% endblock %}

{% block fetch %}
https://github.com/fmtlib/fmt/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:5dea48d1fcddc3ec571ce2058e13910a0d4a6bab4cc09a809d8b1dd1c88ae6f2
{% endblock %}
