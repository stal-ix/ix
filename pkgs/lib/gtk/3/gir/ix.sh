{% extends '//lib/gi/files/full/ix.sh' %}

{% block postinstall %}
{{super()}}
find ${out} -type f -name '*.gir' | grep -v 'Gtk-3.0' | grep -v 'Atk-1.0' | grep -v 'Gdk-3.0' | while read l; do
    rm ${l}
done
{% endblock %}
