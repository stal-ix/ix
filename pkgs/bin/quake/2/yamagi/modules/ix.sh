{% extends '//bin/quake/2/yamagi/t/ix.sh' %}

{% block lib_deps %}
lib/c
lib/curl
lib/sdl/3
lib/opengl
lib/openal
lib/execinfo
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/librarian
{% endblock %}

{% block install %}
cp -R ${tmp}/lib ${out}/
{% for m in self.modules() | parse_list %}
mv ${out}/lib/{{m}}.a ${out}/lib/lib{{m}}.a
patchns ${out}/lib/lib{{m}}.a {{m}}_
{% endfor %}
{% endblock %}
