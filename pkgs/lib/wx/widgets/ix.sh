{% extends '//die/cmake.sh' %}

{% block fetch %}
#https://github.com/wxWidgets/wxWidgets/archive/refs/tags/v3.2.0.tar.gz
#sha:43480e3887f32924246eb439520a3a2bc04d7947712de1ea0590c5b58dedadd9
https://github.com/wxWidgets/wxWidgets/releases/download/v3.2.0/wxWidgets-3.2.0.tar.bz2
sha:356e9b55f1ae3d58ae1fed61478e9b754d46b820913e3bfbc971c50377c1903a
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/gtk/3
lib/pcre/2
{% endblock %}

{% block cmake_flags %}
wxUSE_INTL=OFF
wxUSE_XLOCALE=OFF
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
