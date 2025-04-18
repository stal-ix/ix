{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
extra-cmake-modules
{% endblock %}

{% block version %}
6.13.0
{% endblock %}

{% block fetch %}
https://github.com/KDE/extra-cmake-modules/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:ded2fc1c5aaa3c11fc5e91ed0c16d58be2bf4680874062f72b8cb8059f27b3e7
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export ECM_DIR="${out}/share/ECM/cmake"
{% endblock %}
