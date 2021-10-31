{% extends '//mix/template/autohell.sh' %}

{% block deps %}
# bld lib/intl/mix.sh
# bld lib/iconv/mix.sh
# bld lib/sigsegv/mix.sh
# bld env/c/mix.sh
# bld gnu/patch/mix.sh
# bld boot/final/env/tools/mix.sh
{% block coreutils_deps_extra %}
{% endblock %}
{% endblock %}

{% block cflags %}
export CPPFLAGS="-I${PWD}/lib ${CPPFLAGS}"
export PATH="${PWD}/src:${PATH}"
{% endblock %}

{% block coflags %}
--libexecdir="${out}/bin"
--enable-no-install-program=stdbuf
--enable-single-binary=symlinks
{% block coreutils_coflags_extra %}
--without-gmp
{% endblock %}
{% endblock %}

{% block toolconf %}
cat << EOF > makeinfo
#!$(command -v dash)
EOF

chmod +x makeinfo
{% endblock %}

{% block postconf %}
cat Makefile | grep -v 'LIBINTL = ' > tmp && mv tmp Makefile
{% endblock %}

{% block patch %}
{% if mix.platform.target.os == 'darwin' %}
(cd src && patch) << EOF
{% include 'uname.patch' %}
EOF
{% endif %}
{% endblock %}
