{% extends 'stock/ix.sh' %}

{# TODO(pg): need portal #}

{% block build %}
{{super()}}

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

{% block install %}
{{super()}}
cp imhex ${out}/bin/
mv ${out}/share/imhex/plugins ${out}/bin/
{% endblock %}
