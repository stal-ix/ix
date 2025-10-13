{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
extra-cmake-modules
{% endblock %}

{% block version %}
6.19.0
{% endblock %}

{% block fetch %}
https://github.com/KDE/extra-cmake-modules/archive/refs/tags/v{{self.version().strip()}}.tar.gz
a7f59fc5dcaa6927f0dafea427dd5734d00ea100ad8ddceb2a8c640291d7f527
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export ECM_DIR="${out}/share/ECM/cmake"
{% endblock %}
