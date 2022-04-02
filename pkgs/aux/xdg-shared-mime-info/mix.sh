{% extends '//mix/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/xdg/shared-mime-info/uploads/0ee50652091363ab0d17e335e5e74fbe/shared-mime-info-2.1.tar.xz
sha:b2d40cfcdd84e835d0f2c9107b3f3e77e9cf912f858171fe779946da634e8563
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib/pure
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/glib/codegen
{% endblock %}
