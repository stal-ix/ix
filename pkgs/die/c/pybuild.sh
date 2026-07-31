{% extends 'ix.sh' %}

{% block std_box %}
bld/python
bld/pkg/config
{{super()}}
{% endblock %}

{% block build %}
{% set command_args %}
./build
-j ${make_thrs}
{% block pybuild_target %}
{{self.pkg_name().strip()}}
{% endblock %}
{% block pybuild_flags %}
{% endblock %}
{% endset %}

{{command_args | fix_list}}
{% endblock %}
