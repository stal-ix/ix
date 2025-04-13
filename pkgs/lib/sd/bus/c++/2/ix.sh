{% extends '//lib/sd/bus/c++/ix.sh' %}

{% block pkg_name %}
sdbus-cpp
{% endblock %}

{% block version %}
2.0.0
{% endblock %}

{% block fetch %}
https://github.com/Kistler-Group/sdbus-cpp/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:88af4569161a0d0192f0f4a94582a1af4e75722499d06984fb7f91f638f5afb3
{% endblock %}
