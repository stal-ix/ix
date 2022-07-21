{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/jonas/tig/archive/refs/tags/tig-2.5.6.tar.gz
sha:4805b73b29338ba225bc7b03301b4ed8803433b0a593dcf118bd750ac79a5786
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}
