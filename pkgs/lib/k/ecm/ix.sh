{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://download.kde.org/stable/frameworks/5.99/extra-cmake-modules-5.99.0.tar.xz
sha:01818aa606628db57129f6e22dbae3532464220802d085c6e0689d032e87807e
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export ECM_DIR="${out}/share/ECM/cmake"
{% endblock %}
