{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://www.bytereef.org/software/mpdecimal/releases/mpdecimal-2.5.1.tar.gz
18599e4ffcfe8cd93e0efa8f14f027eb
{% endblock %}

{% block make_target %}
{% endblock %}

{% block bld_deps %}
env/autohell/mix.sh
{% endblock %}

{% block coflags %}
--enable-cxx=no
{% endblock %}
