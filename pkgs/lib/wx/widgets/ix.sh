{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
wxWidgets
{% endblock %}

{% block version_major %}
{{self.version().strip()[:3]}}
{% endblock %}

{% block version %}
3.2.11
{% endblock %}

{% block fetch %}
https://github.com/wxWidgets/wxWidgets/releases/download/v{{self.version().strip()}}/wxWidgets-{{self.version().strip()}}.tar.bz2
6a129015bce2e914e4bf61ec4411854ad962801d47e92f2eb8340adb6a90af08
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
