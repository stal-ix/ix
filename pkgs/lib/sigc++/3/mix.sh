{% extends '//mix/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/libsigc++/3.0/libsigc%2B%2B-3.0.7.tar.xz
sha:bfbe91c0d094ea6bbc6cbd3909b7d98c6561eea8b6d9c0c25add906a6e83d733
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
