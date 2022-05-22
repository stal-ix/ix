{% extends '//aux/adwaita/theme/ix.sh' %}

{% block install %}
{{super()}}
cd ${out}/share/icons
mv Adwaita default
rm -r default/cursors
ln -s default Adwaita
{% endblock %}
