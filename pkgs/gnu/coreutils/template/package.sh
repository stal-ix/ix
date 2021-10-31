{% extends '//mix/template/autohell.sh' %}

{% block deps %}
# bld lib/intl/package.sh
# bld lib/iconv/package.sh
# bld lib/sigsegv/package.sh
# bld env/c/package.sh
# bld gnu/patch/package.sh
# bld boot/final/env/tools/package.sh
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
