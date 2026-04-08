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
lib/shim/redir(from=json.h,to=json-c/json.h)
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/pkg/config
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block cpp_defines %}
HAVE_OPENSSL=1
{% endblock %}

{% block patch %}
# skip config.sh (it checks for cargo) — deps come from bld_libs
: > config.mk

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
