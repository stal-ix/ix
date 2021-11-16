{% extends '//mix/template/autohell.sh' %}

{% block bld_libs %}
lib/intl/mix.sh
lib/iconv/mix.sh
lib/sigsegv/mix.sh
{% endblock %}

{% block bld_deps %}
gnu/patch/mix.sh
env/std/0/mix.sh
{% block coreutils_deps_extra %}
{% endblock %}
{% endblock %}

{% block coflags %}
--libexecdir="${out}/bin"
--enable-no-install-program=stdbuf
--enable-single-binary=symlinks
{% block coreutils_coflags_extra %}
--without-gmp
{% endblock %}
{% endblock %}

{% block patch %}
{% if mix.platform.target.os == 'darwin' %}
(cd src && patch) << EOF
{% include 'uname.patch' %}
EOF
{% endif %}
{% endblock %}
