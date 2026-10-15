{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
wxWidgets
{% endblock %}

{% block version_major %}
{{self.version().strip()[:3]}}
{% endblock %}

{% block version %}
3.2.12
{% endblock %}

{% block fetch %}
https://github.com/wxWidgets/wxWidgets/releases/download/v{{self.version().strip()}}/wxWidgets-{{self.version().strip()}}.tar.bz2
a62719bb5e1dcc41c1a6fc1eecd499c7ee8521f70402c7b1bb3342a1e16344e0
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
wxBUILD_INSTALL_USE_SYMLINK=OFF
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
