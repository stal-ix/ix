{% extends 't/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/shim/fake/pkg(pkg_name=appstream,pkg_ver=1.1.0)
{% endblock %}

{% block bld_tool %}
bin/appstream/cli
{{super()}}
{% endblock %}
