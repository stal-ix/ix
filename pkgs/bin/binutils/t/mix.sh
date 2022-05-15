{% extends '//mix/autohell.sh' %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block configure_flags %}
--disable-plugins
--disable-werror
--with-system-zlib
--with-system-zlib
--enable-deterministic-archives
{% endblock%}

{% block patch %}
cat << EOF > bfdver.h
#define BFD_VERSION_DATE 20220209
#define BFD_VERSION 238000000
#define BFD_VERSION_STRING  "(GNU Binutils) " "2.38"
#define REPORT_BUGS_TO "<https://sourceware.org/bugzilla/>"
EOF
{% endblock %}

{% block configure %}
{{super()}}
sed -e 's|../.*/lib.*a||g' -i Makefile
{% endblock %}
