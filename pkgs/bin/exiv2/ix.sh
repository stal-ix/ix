{% extends '//lib/exiv2/ix.sh' %}

{% block bld_libs %}
lib/ssh
lib/curl
lib/intl
lib/iconv
lib/expat
{{super()}}
{% endblock %}

{% block bld_tool %}
bld/gettext
{{super()}}
{% endblock %}

{% block cmake_flags %}
{{super()}}
EXIV2_ENABLE_VIDEO=ON
EXIV2_ENABLE_NLS=ON
EXIV2_ENABLE_XMP=ON
EXIV2_ENABLE_CURL=ON
EXIV2_ENABLE_SSH=ON
EXIV2_ENABLE_WEBREADY=ON
EXIV2_ENABLE_BMFF=ON
{% endblock %}
