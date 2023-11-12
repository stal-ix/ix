{% extends '//lib/archive/lite/t/ix.sh' %}

{% block install %}
{{super()}}
cd ${out}/bin
ln -s bsdtar tar
ln -s bsdcpio cpio
{% endblock %}

{% block sanitize_build_files %}
{{super()}}
sed -e 's|-Wl,-Bstatic||g'  \
    -e 's|-Wl,-Bdynamic||g' \
    -e 's|-Wl,--gc-sections||g' \
    -i ${tmp}/obj/build.ninja
{% endblock %}
