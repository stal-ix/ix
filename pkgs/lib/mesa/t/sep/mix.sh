{% extends '//lib/mesa/t/nodrv/mix.sh' %}

{% block c_rename_symbol %}
{{super()}}
handle_table_remove
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/scripts/librarian
{% endblock %}

{% block install %}
{{super()}}

cd ${out}/lib

{% block merge_drivers %}
mv dri/*.so libgallium.a
joinar libgldrivers.a libgallium* libvulkan_*
rm libgallium* libvulkan_*
{% endblock %}

rm -r dri

substr libgbm.a libEGL.a
substr libgbm.a libgldrivers.a
substr libEGL.a libgldrivers.a

find . -type f -name '*.pc' | while read l; do
    sed -e 's|glesv1_cm,||g' -i ${l}
done
{% endblock %}

{% block skip_auto_lib_env %}
{% endblock %}
