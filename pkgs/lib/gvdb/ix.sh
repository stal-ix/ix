{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gvdb/-/archive/2b42fc75f09dbe1cd1057580b5782b08f2dcb400/gvdb-2b42fc75f09dbe1cd1057580b5782b08f2dcb400.tar.bz2
dd5ca0912e88aef0110cf36f0de1ded797db45abc65886309dbfbd4b1eb671aa
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}


