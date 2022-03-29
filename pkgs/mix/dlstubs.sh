{% extends 'premain.sh' %}

{% block std_box %}
bld/scripts/dlfcn
{{super()}}
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block premain_lang %}
c++
{% endblock %}

{% set export_libs %}
{% block export_libs %}
{% endblock %}
{% endset %}

{% block premain_code_gen %}
(
set -eu

cat << EOF
{% block export_symbols %}
{% endblock %}
EOF

{% block export_symbols_sh %}
{% for x in mix.parse_list(export_libs) %}
llvm-nm --defined-only --extern-only --no-weak {{x}}
{% endfor %}
{% endblock %}
) | dl_stubs {{self.export_lib().strip()}}
{% endblock %}
