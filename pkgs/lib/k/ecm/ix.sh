{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://download.kde.org/stable/frameworks/5.112/extra-cmake-modules-5.112.0.tar.xz
sha:ac1084772280d57e5f31e2e2816ecbec4884169413f24f063660eb6f15d4c2e2
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export ECM_DIR="${out}/share/ECM/cmake"
{% endblock %}
