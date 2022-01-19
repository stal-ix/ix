{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://releases.pagure.org/xmlto/xmlto-0.0.28.tar.bz2
93bab48d446c826399d130d959fe676f
{% endblock %}

{% block bld_libs %}
lib/c
lib/xslt
{% endblock %}

{% block bld_tool %}
bin/flex
bin/getopt
{% endblock %}

{% block run_deps %}
lib/xslt
bin/getopt
{% endblock %}
