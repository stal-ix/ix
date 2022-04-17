{% extends '//mix/c_std.sh' %}

{% block step_unpack %}
:
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk/deps
lib/web/view
{% endblock %}

{% block build %}
cc -o webview -x c++ - << EOF
#include <stdio.h>
#include <stdlib.h>
#define WEBVIEW_HEADER
#include <webview.h>

int main(int argc, char** argv) {
    webview_t w = webview_create(0, NULL);

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
{% endblock %}
