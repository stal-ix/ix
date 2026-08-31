{% extends '//bin/zathura/headers/ix.sh' %}

{% block ver %}
8_9
{% endblock %}

{% block plugins %}
cb
ps
djvu
{{pdf_plugin}}
{% endblock %}

{% block bld_libs %}
lib/magic
lib/seccomp
lib/sqlite/3
{% for x in self.plugins() | parse_list %}
lib/dl/fix(dl_orig={{x}},dl_for=bin/zathura/{{x.replace('-', '/')}},dl_lib={{x.split('-')[-1]}},dl_symbols=zathura_plugin_{{self.ver().strip()}}={{x.split('-')[-1]}}_zathura_plugin_{{self.ver().strip()}})
{% endfor %}
{{super()}}
{% endblock %}

{% block meson_flags %}
{{super()}}
# TODO(pg): fix it
seccomp=disabled
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|\.so|\.plugin|' -i ${l}
done
sed -e "s|plugindir = .*|plugindir = join_paths(datadir, 'plugins')|" -i meson.build
{% endblock %}

{% block install %}
{{super()}}
mkdir -p ${out}/share/plugins
echo > ${out}/share/plugins/{{pdf_plugin}}.plugin
echo > ${out}/share/plugins/djvu.plugin
{% endblock %}
