{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
http://ftp.gnu.org/gnu/mtools/mtools-4.0.40.tar.lz
sha:325d01cc5ca791d0c527ccbccdee053c89a7be2db3cbf9bf24d1ee0661aa100c
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
{% endblock %}
