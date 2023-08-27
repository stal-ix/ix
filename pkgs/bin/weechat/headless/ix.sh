{% extends '//bin/weechat/static/ix.sh' %}

{% block cmake_flags %}
{{super()}}
ENABLE_NCURSES=OFF
ENABLE_HEADLESS=ON
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/bin
mv weechat weechat-headless
rm -rf ${out}/share
{% endblock %}
