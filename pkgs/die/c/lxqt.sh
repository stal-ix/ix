{% extends 'cmake.sh' %}

{% block bld_tool %}
bld/lxqt
{% endblock %}

{% block cmake_flags %}
LXQT_SHARE_DIR=${out}/share/lxqt
LXQT_TRANSLATIONS_DIR=${out}/share/lxqt/translations
LXQT_GRAPHICS_DIR=${out}/share/lxqt/graphics
LXQT_ETC_XDG_DIR=${out}/share/lxqt/xdg
LXQT_DATA_DIR=${out}/share
{% endblock %}
