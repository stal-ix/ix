{% extends '//bin/meson/60/ix.sh' %}

{% block patch %}
sed -e 's|self._search_libs.*|[], []|' \
    -i mesonbuild/dependencies/pkgconfig.py

sed -e 's|if lang not in lang_map|if True|' \
    -i mesonbuild/compilers/mixins/gnu.py

{{super()}}
{% endblock %}
