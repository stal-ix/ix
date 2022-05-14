{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://download.kde.org/stable/frameworks/5.94/extra-cmake-modules-5.94.0.tar.xz
sha:23548a8ce2b998cfa675fc00112bf93914ee25194f0bfdf832d283c8d678d279
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export ECM_DIR="${out}/share/ECM/cmake"
{% endblock %}
