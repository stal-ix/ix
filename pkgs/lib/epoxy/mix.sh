{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://github.com/anholt/libepoxy/archive/refs/tags/1.5.9.tar.gz
cfae0a80ac41fb4a5f0a0c4a41bf0559
{% endblock %}

{% block lib_deps %}
lib/c
lib/mesa
{% endblock %}

{% block meson_flags %}
x11=false
{% endblock %}
