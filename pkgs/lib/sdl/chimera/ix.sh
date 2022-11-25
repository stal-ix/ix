{% extends '//lib/sdl/2/ix.sh' %}

{% block bld_tool %}
bld/librarian
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
rm lib*main*
patchns libSDL2.a V2_
{% endblock %}
