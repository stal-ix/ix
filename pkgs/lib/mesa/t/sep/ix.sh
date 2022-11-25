{% extends '//lib/mesa/t/nodrv/ix.sh' %}

{% block c_rename_symbol %}
{{super()}}
handle_table_remove
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/librarian
{% endblock %}

{% block install %}
{{super()}}

cd ${out}/lib

{% block merge_drivers %}
mv dri/*.so libgallium.a
{% if vulkan %}
joinar libgldrivers.a libgallium* libvulkan_*
rm libgallium* libvulkan_*
{% else %}
mv libgallium* libgldrivers.a
{% endif %}
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
