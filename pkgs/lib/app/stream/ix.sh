{% extends 't/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/shim/fake/pkg(pkg_name=appstream,pkg_ver={{self.version().strip()}})
{% endblock %}

{% block bld_tool %}
bin/appstream/cli
{{super()}}
{% endblock %}
