{% extends '//bin/meson/1/2/ix.sh' %}

{% block patch %}
{{super()}}

sed -e 's|self._search_libs.*|[], []|' \
    -i mesonbuild/dependencies/pkgconfig.py

sed -e 's|if lang not in lang_map|if True|' \
    -i mesonbuild/compilers/mixins/gnu.py
{% endblock %}
