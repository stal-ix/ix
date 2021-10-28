{% extends '//mix/template/autohell.sh' %}

{% block deps %}
# bld lib/intl lib/iconv lib/sigsegv
# bld env/c gnu/patch boot/final/env/tools
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
