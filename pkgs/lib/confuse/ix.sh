{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/libconfuse/libconfuse/archive/refs/tags/v3.3.tar.gz
sha:cb90c06f2dbec971792af576d5b9a382fb3c4ca2b1deea55ea262b403f4e641e
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/flex
bld/gettext
{% endblock %}
