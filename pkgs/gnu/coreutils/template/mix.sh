{% extends '//mix/template/autohell.sh' %}

{% block bld_deps %}
lib/intl/mix.sh
lib/iconv/mix.sh
lib/sigsegv/mix.sh
gnu/patch/mix.sh
env/std/0/mix.sh
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
