{% extends '//die/c/meson.sh' %}

{% block version %}
2.14.3
{% endblock %}

{% block pkg_name %}
freetype-demos
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/freetype/freetype-demos/-/archive/VER-{{self.version().strip().replace('.', '-')}}/freetype-demos-VER-{{self.version().strip().replace('.', '-')}}.tar.bz2
d7d8c120ee84dc34efaa3c0470ba9937aeeeaff2036d318e381e25f537b764c2
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
