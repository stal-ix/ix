{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/rzvncj/xCHM/archive/refs/tags/1.34.tar.gz
sha:ad23b9bd36cdb3648310930a6f70e107c4544749eb4372019a9ae8d159c0a722
{% endblock %}

{%block bld_libs %}
lib/c
lib/chm
lib/wx/widgets
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}
