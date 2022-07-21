{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.x.org/pub/individual/util/util-macros-1.19.3.tar.bz2
sha:0f812e6e9d2786ba8f54b960ee563c0663ddbe2434bf24ff193f5feab1f31971
{% endblock %}

{% block bld_tool %}
bld/auto
{% endblock %}

{% block strip_pc %}
: actually need it
{% endblock %}
