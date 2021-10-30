{% extends 'template.sh' %}

{% set meson_flags %}
-Dprefix=${out}
{% if mix.platform.target.os == 'darwin' %}
-Db_asneeded=false
-Db_lundef=false
{% endif %}
{% block meson_flags %}
{% endblock %}
{% endset %}

{% block configure %}
meson {{mix.fix_list(meson_flags)}} _build
{% endblock %}

{% block build %}
cd _build && ninja -j ${make_thrs}
{% endblock %}

{% block install %}
cd _build && ninja install
{% endblock %}
