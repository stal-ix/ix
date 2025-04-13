{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libcloudproviders
{% endblock %}

{% block version %}
0.3.6
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/World/libcloudproviders/-/archive/{{self.version().strip()}}/libcloudproviders-{{self.version().strip()}}.tar.bz2
sha:316975e2e04588e44808cc7e4ff2800444103843e9533bd17ac0f4964c094f83
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}
