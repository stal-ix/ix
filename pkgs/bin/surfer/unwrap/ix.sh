{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://github.com/nihilowy/surfer
{% endblock %}

{% block git_commit %}
704299e0f5a3ad97446288f54c419f136e417865
{% endblock %}

{% block git_sha %}
d62b516e8937ae6fcd7e6f0f0bc15b046eacd4d566445666ddf08e72b1a85b75
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk
lib/glib
lib/notify
lib/gtk/deps
lib/gdk/pixbuf
lib/web/kit/gtk
{% endblock %}

{% block build_flags %}
wrap_cc
shut_up
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}

{% block cpp_defines %}
SoupURI=GUri
{% endblock %}

{% block patch %}
cat - surfer.c << EOF > _
struct _GUri {
    char     *scheme;
    char     *userinfo;
    char     *host;
    int       port;
    char     *path;
    char     *query;
    char     *fragment;
    char     *user;
    char     *password;
    char     *auth_params;
};

#define soup_uri_decode(x) g_uri_parse(x, 0, NULL)
EOF

mv _ surfer.c

sed -e 's|/usr||g' -i Makefile
{% endblock %}

{% block make_flags %}
DESTDIR=${out}
{% endblock %}

{% block git_version %}
v3
{% endblock %}
