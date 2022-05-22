{% extends 'std/ix.sh' %}

{% block install %}
mkdir -p ${out}/share/fonts

find . -type f -name '*.ttf' | while read l; do
    cp "${l}" ${out}/share/fonts/
done

find . -type f -name '*.otf' | while read l; do
    cp "${l}" ${out}/share/fonts/
done
{% endblock %}
