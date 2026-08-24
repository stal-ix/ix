{% extends '//lib/fontconfig/bootstrap/ix.sh' %}

{% block meson_flags %}
{{super()}}
default-fonts-dirs=
{% endblock %}

{% block patch %}
find . -type f -name '*.c' | while read l; do
    sed -e 's|.*/usr/share.*||' \
        -e 's|.*/usr/local/share.*||' \
        -i ${l}
done
{% endblock %}

{% block use_data %}
lib/fontconfig/data
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/reloc
{% endblock %}

{% block configure %}
{{super()}}
relocate "${FONTCONFIG_DATA}"
{% endblock %}
