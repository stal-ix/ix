{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/KDE/extra-cmake-modules/archive/refs/tags/v5.247.0.tar.gz
sha:998b4400cb4d55bfd7ffd8d09864645f469f67f476f48989f94aea604b2ddb7f
#https://download.kde.org/stable/frameworks/5.113/extra-cmake-modules-5.113.0.tar.xz
#sha:265e5440eebeca07351a469e617a4bf35748927bd907b00ace9c018392bb3bc4
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export ECM_DIR="${out}/share/ECM/cmake"
{% endblock %}
