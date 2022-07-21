{% extends '//die/c/autohell.sh' %}

{# can not build with current wxWidgets #}

{% block fetch %}
https://downloads.sourceforge.net/project/codeblocks/Sources/20.03/codeblocks-20.03.tar.xz
sha:15eeb3e28aea054e1f38b0c7f4671b4d4d1116fd05f63c07aa95a91db89eaac5
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/boost
lib/wx/widgets
{% endblock %}

{% block configure_flags %}
--disable-pch
{% endblock %}
