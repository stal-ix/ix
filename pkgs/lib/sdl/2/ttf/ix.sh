{% extends 't/ix.sh' %}

{% block cmake_flags %}
{{super()}}
SDL2TTF_SAMPLES=OFF
{% endblock %}

{% block install %}
{{super()}}
find ${out}/lib/cmake -type f | while read l; do
    sed -e 's|::SDL2_ttf-static|::SDL2_ttf|g' -i ${l}
done
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/SDL2 \${CPPFLAGS}"
{% endblock %}
