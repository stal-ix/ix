{% extends '//lib/mesa/t/nodrv/mix.sh' %}

{% block c_rename_symbol %}
#SHA1Pad
#SHA1Init
#SHA1Final
#SHA1Update
#SHA1Transform
handle_table_remove
{% endblock %}

{% block install %}
{{super()}}

cd ${out}/lib

base64 -d << EOF > substr.py
{% include 'substr.py/base64' %}
EOF

{% block merge_drivers %}
mv dri/*.so libgallium.a
python3 substr.py libvulkan* libgallium.a
llvm-ar qL libgldrivers.a libgallium* libvulkan_*
rm libgallium* libvulkan_*
{% endblock %}

rm -r dri

python3 substr.py libgbm.a libEGL.a
python3 substr.py libgbm.a libgldrivers.a
python3 substr.py libEGL.a libgldrivers.a

rm substr.py

find . -type f -name '*.pc' | while read l; do
    sed -e 's|glesv1_cm,||g' -i ${l}
done
{% endblock %}

{% block skip_auto_lib_env %}
{% endblock %}
