{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://download.kde.org/stable/frameworks/5.95/extra-cmake-modules-5.95.0.tar.xz
sha:ffa02309d92958353e8e7837970e0d038475da5a18074e3442bf6b78ac91ad5a
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export ECM_DIR="${out}/share/ECM/cmake"
{% endblock %}
