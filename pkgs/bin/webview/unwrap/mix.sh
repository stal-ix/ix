{% extends '//die/c_std.sh' %}

{% block step_unpack %}
:
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk/deps
lib/web/view
lib/web/kit/deps
lib/{{allocator}}/trim(delay=5,bytes=10000000)
{% endblock %}

{% block build %}
cc -o webview -x c++ - << EOF
#include <stdio.h>
#include <stdlib.h>
#define WEBVIEW_HEADER
#include <webview.h>
#include <gtk/gtk.h>

int main(int argc, char** argv) {
    webview_t w = webview_create(0, NULL);

    g_object_set(gtk_settings_get_default(), "gtk-xft-dpi", 96 * 1024, nullptr);

    webview_set_title(w, "Webview Example");
    webview_set_size(w, 800, 600, WEBVIEW_HINT_NONE);
    webview_navigate(w, argv[1]);
    webview_run(w);
    webview_destroy(w);

    return 0;
}
EOF
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp webview ${out}/bin/
{% call hooks.wrap_xdg_binary('webview') %}
export WEBKIT_EXEC_PATH="\$(dirname \$(which WebKitWebProcess))"
{% endcall %}
{% endblock %}
