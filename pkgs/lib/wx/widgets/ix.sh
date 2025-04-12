{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
wxWidgets
{% endblock %}

{% block version_major %}
3.2
{% endblock %}

{% block version %}
{{self.version_major().strip()}}.5
{% endblock %}

{% block fetch %}
https://github.com/wxWidgets/wxWidgets/releases/download/v{{self.version().strip()}}/wxWidgets-{{self.version().strip()}}.tar.bz2
sha:0ad86a3ad3e2e519b6a705248fc9226e3a09bbf069c6c692a02acf7c2d1c6b51
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
export CPPFLAGS="-I${out}/include/wx-{{self.version_major().strip()}} \${CPPFLAGS}"
{% endblock %}
