{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
flex
{% endblock %}

{% block version %}
2.6.4
{% endblock %}

{% block fetch %}
https://github.com/westes/flex/files/981163/flex-{{self.version().strip()}}.tar.gz
sha:e87aae032bf07c26f85ac0ed3250998c37621d95f8bd748b31f15b33c45ee995
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/texinfo
{% endblock %}

{% block std_box %}
bld/flex
bld/bison
{{super()}}
{% endblock %}
