{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
extra-cmake-modules
{% endblock %}

{% block version %}
6.17.0
{% endblock %}

{% block fetch %}
https://github.com/KDE/extra-cmake-modules/archive/refs/tags/v{{self.version().strip()}}.tar.gz
2072293d505fcc456bbdfdd01096c10b449cf3796de945cf35b54c100ba7a4fc
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export ECM_DIR="${out}/share/ECM/cmake"
{% endblock %}
