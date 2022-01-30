{% extends '//aux/adwaita/theme/mix.sh' %}

{% block install %}
{{super()}}
cd ${out}
rm -rf lib
cd share/icons
mkdir default
mv Adwaita/cursors default/
rm -rf Adwaita
{% endblock %}

{% block env %}
export ADWAITA_CURSORS="${out}/share/icons"
{% endblock %}
