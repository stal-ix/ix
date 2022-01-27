{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/glibmm/2.66/glibmm-2.66.2.tar.xz
sha:b2a4cd7b9ae987794cbb5a1becc10cecb65182b9bb841868625d6bbb123edb1d
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/sigc++/2
{% endblock %}
