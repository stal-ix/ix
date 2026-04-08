{% extends '//die/c/make.sh' %}

{% block pkg_name %}
newsboat
{% endblock %}

{% block version %}
2.42
{% endblock %}

{% block fetch %}
https://newsboat.org/releases/{{self.version().strip()}}/newsboat-{{self.version().strip()}}.tar.xz
7fe56497f5368d7d5f9ab76e755e768c0e26605cc32d56b94d3133ee81d88e9b
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/stfl
lib/curl
lib/xml/2
lib/json/c
lib/sqlite/3
lib/ncurses
lib/intl/gnu
lib/iconv
lib/news/boat
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/pkg/config
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block patch %}
# generate config.mk from pkg-config, skip config.sh (it checks for cargo)
: > config.mk
for pkg in sqlite3 libcurl libxml-2.0 stfl json-c ncursesw libcrypto libssl; do
    if pkg-config --exists "${pkg}" 2>/dev/null; then
        cflags=$(pkg-config --cflags "${pkg}")
        libs=$(pkg-config --libs "${pkg}")
        test -n "${cflags}" && echo "DEFINES+=${cflags}" >> config.mk
        test -n "${libs}" && echo "LDFLAGS+=${libs}" >> config.mk
    fi
done

# find prebuilt cxxbridge headers from lib/news/boat
nb_inc=$(echo ${CPPFLAGS} | tr ' ' '\n' | grep news | head -1 | sed 's|-I||')

# remove cargo dependency — we use prebuilt lib/news/boat
sed -i 's|+$(CARGO).*||' Makefile
sed -i 's|$(NEWSBOATLIB_OUTPUT)||g' Makefile
sed -i "s|-I\$(CARGO_TARGET_DIR)/cxxbridge/|-I${nb_inc}/|" Makefile
{% endblock %}

{% block make_target %}
newsboat podboat
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp newsboat ${out}/bin/
cp podboat ${out}/bin/
{% endblock %}
