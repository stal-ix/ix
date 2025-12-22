{% extends 't/ix.sh' %}

{% block bld_libs %}
bin/evince/3/modules
{% for m in ix.parse_list(self.modules()) %}
lib/dl/fix(dl_lib={{m}}document,dl_symbols=register_evince_backend={{m}}_register_evince_backend)
{% endfor %}
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/wrap/cc/plugins/unreg(bins=evince)
{% endblock %}

{% block patch %}
find . -type f -name meson.build | while read l; do
    sed -e 's|.*adwaita_icon.*||' -i ${l}
done
sed -e 's|+multipage||' \
    -e 's|ev_libdir, ev_backends_subdir|ev_datadir, ev_backends_subdir|' \
    -i meson.build
{% endblock %}

{% block install %}
{{super()}}
cp -R ${out}/share/evince/icons ${out}/share/
rm -rf ${out}/share/evince/icons
rm -r ${out}/bin/bin_*
{% endblock %}
