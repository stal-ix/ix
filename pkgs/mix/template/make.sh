{% extends 'std.sh' %}

{% block std_env %}
dev/build/make/mix.sh
{{super()}}
{% endblock %}

{% set make_flags %}
SHELL="$(which dash)"
PREFIX="${out}"
prefix="${out}"
V=1

{% block make_flags %}
{% endblock %}

{% block make_target %}
{% endblock %}
{% endset %}

{% set make_install_target %}
{% block make_install_target %}
install
{% endblock %}
{% endset %}

{% set real_flags %}{{mix.fix_list(make_flags)}}{% endset %}

{% block build %}
make -j {% block make_thrs %}${make_thrs}{% endblock %} {{real_flags}} || make {{real_flags}}
{% endblock %}

{% block install %}
make {{real_flags}} {{make_install_target.strip()}}
{% endblock %}
