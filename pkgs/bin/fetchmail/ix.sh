{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
fetchmail
{% endblock %}

{% block version %}
6.5.7
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/fetchmail/branch_{{self.version().strip()[:3]}}/fetchmail-{{self.version().strip()}}.tar.xz
73eb6b1d421b5986866ad4a6b777c1140a39005298c63bf847de537976cbfbdb
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
bld/gettext
{% endblock %}

{% block conf_ver %}
2/72
{% endblock %}
