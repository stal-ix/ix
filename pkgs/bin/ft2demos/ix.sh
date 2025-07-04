{% extends '//die/c/meson.sh' %}

{% block version %}
2-13-0
{% endblock %}

{% block pkg_name %}
freetype-demos
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/freetype/freetype-demos/-/archive/VER-{{self.version().strip()}}/freetype-demos-VER-{{self.version().strip()}}.tar.bz2
afcc45109122cc4c805b20883033423e7740baf6d54b180bf9568f34790e9e3b
{% endblock %}

{% block bld_libs %}
lib/c
lib/freetype
{% endblock %}

{% block meson_flags %}
librsvg=disabled
{% endblock %}

{% block patch %}
sed -e 's|libfreetype2 = subproject|libfreetype2 = dependency|' -i meson.build
sed -e 's|.*get_variable.*freetype_dep.*|libfreetype2_dep = libfreetype2|' -i meson.build
sed -e 's|.*freetype2.*truetype.*.*||' -i meson.build
echo 'int main() {}' > src/ftvalid.c
echo 'int main() {}' > src/ttdebug.c
{% endblock %}
