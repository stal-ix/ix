set -eu

if test -d ${out}/include; then
    echo 'export CPPFLAGS="-I'${out}'/include ${CPPFLAGS}"'
fi

if test -d ${out}/lib/cmake; then
    echo 'export CMAKE_PREFIX_PATH="'${out}':${CMAKE_PREFIX_PATH}"'
fi

if test -d ${out}/lib/pkgconfig; then
    echo 'export PKG_CONFIG_PATH="'${out}'/lib/pkgconfig:${PKG_CONFIG_PATH}"'
fi

if test -d ${out}/share/pkgconfig; then
    echo 'export PKG_CONFIG_PATH="'${out}'/share/pkgconfig:${PKG_CONFIG_PATH}"'
fi

if test -d ${out}/lib/bin; then
    echo 'export PATH="'${out}'/lib/bin:${PATH}"'
fi

if test -d ${out}/bin; then
    echo 'export PATH="'${out}'/bin:${PATH}"'
fi

if test -d ${out}/lib; then
    echo 'export MAKE_VPATH="'${out}'/lib:${MAKE_VPATH}"'
fi

if test -d ${out}/lib/aux/aclocal; then
    echo 'export ACLOCAL_PATH="'${out}'/lib/aux/aclocal:${ACLOCAL_PATH}"'
fi

if test -d ${out}/share/aclocal; then
    echo 'export ACLOCAL_PATH="'${out}'/share/aclocal:${ACLOCAL_PATH}"'
fi

{% block skip_auto_lib_env %}
if test -d ${out}/lib; then (
    cd ${out}/lib

    ls | grep 'lib.*\.a' | sort | while read l; do
        a=${l%\.a}
        b=${a#lib}

        echo 'export LDFLAGS="-L'${PWD}' -l'${b}' ${LDFLAGS}"'
    done
) fi
{% endblock %}
