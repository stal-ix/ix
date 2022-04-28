{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://download.kde.org/stable/frameworks/5.93/extra-cmake-modules-5.93.0.tar.xz
sha:093dea7b11647bc5f74e6971d47ef15b5c410cba2b4620acae00f008d5480b21
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export ECM_DIR="${out}/share/ECM/cmake"
{% endblock %}
