{% extends 't/ix.sh' %}

{% block bld_libs %}
lib/curl/dl
lib/sdl/deps
lib/openal/dl
bin/quake/2/yamagi/modules
{% for m in self.modules() | parse_list %}
{% if 'game' in m %}
lib/dl/fix(dl_lib={{m}},dl_symbols=GetGameAPI={{m}}_GetGameAPI)
{% else %}
lib/dl/fix(dl_lib={{m}},dl_symbols=GetRefAPI={{m}}_GetRefAPI)
{% endif %}
{% endfor %}
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp release/quake2 ${out}/bin/
{% endblock %}
