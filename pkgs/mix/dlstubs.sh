{% extends 'premain.sh' %}

{% block std_box %}
lib/dlfcn/scripts
{{super()}}
{% endblock %}

{% block premain_lang %}
c++
{% endblock %}

{% block premain_code_gen %}
(
set -eu

cat << EOF
{% block export_symbols %}
{% endblock %}
EOF

{% block export_symbols_sh %}
{% endblock %}
) | dl_stubs {{self.export_lib().strip()}}
{% endblock %}
