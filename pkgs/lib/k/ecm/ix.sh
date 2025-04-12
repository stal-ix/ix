{% extends '//die/c/cmake.sh' %}

{% block version %}
6.1.0
{% endblock %}

{% block fetch %}
https://github.com/KDE/extra-cmake-modules/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:bbcbce2fc71656028e9137b38b8bd2f1cbf6bf6881e6c21f023dbef1bbc1f17a
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export ECM_DIR="${out}/share/ECM/cmake"
{% endblock %}
