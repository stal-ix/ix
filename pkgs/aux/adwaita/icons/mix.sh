{% extends '//aux/adwaita/theme/mix.sh' %}

{% block install %}
{{super()}}
cd ${out}/share/icons
rm -r Adwaita/cursors
ln -s Adwaita default
{% endblock %}
