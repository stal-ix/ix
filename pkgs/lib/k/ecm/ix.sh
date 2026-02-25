{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
extra-cmake-modules
{% endblock %}

{% block version %}
6.23.0
{% endblock %}

{% block fetch %}
https://github.com/KDE/extra-cmake-modules/archive/refs/tags/v{{self.version().strip()}}.tar.gz
b43ed89439b3e919c78d3021ff89691ba497cf212649a6de8951211269ec4668
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export ECM_DIR="${out}/share/ECM/cmake"
{% endblock %}
