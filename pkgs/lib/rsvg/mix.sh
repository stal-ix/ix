{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://download.gnome.org/sources/librsvg/2.40/librsvg-2.40.21.tar.xz
66df60ef1909d6e24df8244042422a98
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
lib/glib/mix.sh
{% endblock %}
