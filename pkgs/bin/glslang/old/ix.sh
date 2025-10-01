{% extends '//lib/glslang/t/ix.sh' %}

{% block version %}
15.4.0
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/glslang/archive/refs/tags/{{self.version().strip()}}.tar.gz
b16c78e7604b9be9f546ee35ad8b6db6f39bbbbfb19e8d038b6fe2ea5bba4ff4
{% endblock %}
