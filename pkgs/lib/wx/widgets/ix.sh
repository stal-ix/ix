{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
wxWidgets
{% endblock %}

{% block version_major %}
{{self.version().strip()[:3]}}
{% endblock %}

{% block version %}
3.2.8.1
{% endblock %}

{% block fetch %}
https://github.com/wxWidgets/wxWidgets/releases/download/v{{self.version().strip()}}/wxWidgets-{{self.version().strip()}}.tar.bz2
sha:ad0cf6c18815dcf1a6a89ad3c3d21a306cd7b5d99a602f77372ef1d92cb7d756
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
