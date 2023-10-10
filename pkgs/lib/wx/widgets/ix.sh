{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/wxWidgets/wxWidgets/releases/download/v3.2.3/wxWidgets-3.2.3.tar.bz2
sha:c170ab67c7e167387162276aea84e055ee58424486404bba692c401730d1a67a
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/intl
lib/gtk/3
lib/pcre/2
lib/notify
{% endblock %}

{% block cmake_flags %}
wxUSE_XLOCALE=OFF
{% endblock %}

{% block cpp_defines %}
_NL_ADDRESS_LANG_NAME=0
_NL_IDENTIFICATION_LANGUAGE=0
_NL_ADDRESS_COUNTRY_NAME=0
_NL_IDENTIFICATION_TERRITORY=0
_NL_ADDRESS_LANG_NAME=0
_NL_IDENTIFICATION_LANGUAGE=0
_NL_ADDRESS_COUNTRY_NAME=0
{% endblock %}

{% block patch %}
cat - src/gtk/menu.cpp << EOF > _
#include "wx/scopedptr.h"
EOF

mv _ src/gtk/menu.cpp
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/wx-3.2 \${CPPFLAGS}"
{% endblock %}
