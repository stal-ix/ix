{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://www.tcpdump.org/release/libpcap-1.10.1.tar.gz
sha:ed285f4accaf05344f90975757b3dbfe772ba41d1c401c2648b7fa45b711bdd4
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}
