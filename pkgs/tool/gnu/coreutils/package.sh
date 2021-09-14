{% extends '//util/autohell.sh' %}

{% block deps %}
# bld lib/intl lib/iconv lib/sigsegv
# bld env/c tool/text/gnu/patch boot/final/env/tools
{% endblock %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/coreutils/coreutils-8.32.tar.xz
# md5 022042695b7d5bcf1a93559a9735e668
{% endblock %}

{% block cflags %}
export CPPFLAGS="-I$(pwd)/lib ${CPPFLAGS}"
export PATH="$(pwd)/src:${PATH}"
{% endblock %}

{% block coflags %}
--libexecdir="${out}/bin"
--without-gmp
--enable-no-install-program=stdbuf
--enable-single-binary=symlinks
{% endblock %}

{% block postconf %}
cat Makefile | grep -v 'LIBINTL = ' > tmp && mv tmp Makefile
{% endblock %}

{% block prebuild %}
make LN_S=ln -j ${make_thrs}

{% if mix.platform.target.os == 'darwin' %}
(
    cd src

    (base64 -d | patch) << EOF
{% include 'uname.patch/base64' %}
EOF
)
{% endif %}
{% endblock %}
