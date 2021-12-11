{% extends '//dev/build/meson/mix.sh' %}

{% block build %}
{{super()}}

cd meson

sed -e 's|if lang not in lang_map|if True|' -i mesonbuild/compilers/mixins/gnu.py
{% endblock %}
