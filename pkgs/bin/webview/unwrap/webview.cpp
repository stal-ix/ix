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
