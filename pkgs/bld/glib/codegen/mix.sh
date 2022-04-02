{% extends '//mix/hub.sh' %}

{% block run_deps %}
bld/python
bin/glib/codegen(std_box=bld/bootbox,intl_ver=stub)
{% endblock %}
