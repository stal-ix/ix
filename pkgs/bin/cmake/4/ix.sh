{% extends '//bin/cmake/ix.sh' %}

{% block version %}
4.4.3
{% endblock %}

{% block fetch %}
https://github.com/Kitware/CMake/archive/refs/tags/v{{self.version().strip()}}.tar.gz
bfd14c62cf4bfb2fd10525449ea59007d3325e7641349e5b7e69cee1127f2e7d
{% endblock %}
