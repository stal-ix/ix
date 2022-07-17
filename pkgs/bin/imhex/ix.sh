{% extends 'stock/ix.sh' %}

{% block build %}
{{super()}}

>${tmp}/obj/plugins/builtin.hexplug

dl_stubs << EOF >> stubs.c
builtin initializePlugin     initializePlugin
builtin getPluginName        getPluginName
builtin getPluginAuthor      getPluginAuthor
builtin getPluginDescription getPluginDescription
builtin getCompatibleVersion getCompatibleVersion
builtin setImGuiContext      setImGuiContext
builtin isBuiltinPlugin      isBuiltinPlugin
EOF

cc -o imhex stubs.c $(find ${tmp} -type f -name '*.o' | grep -v 'libromfs.*main')
{% endblock %}

{% block postinstall %}
cp imhex ${out}/bin/
cp -R ${out}/share/imhex/plugins ${out}/bin/
{% endblock %}
