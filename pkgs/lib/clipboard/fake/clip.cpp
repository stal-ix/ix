#include "libclipboard.h"

#include <stdlib.h>
#include <string.h>

#include <map>
#include <string>

extern "C" {
    struct Clip {
        Clip(clipboard_opts* opts)
            : Opts_(opts)
        {
        }

        void clear(clipboard_mode mode) {
            if (auto it = Dat_.find(mode); it != Dat_.end()) {
                it->second.clear();
            }
        }

        bool hasOwnership(clipboard_mode mode) {
            return true;
        }

        char* text(clipboard_mode mode, int* length) {
            if (auto it = Dat_.find(mode); it != Dat_.end()) {
                *length = it->second.size();

                return strdup((char*)it->second.data());
            }

            return nullptr;
        }

        bool setText(clipboard_mode mode, const char* str, size_t length) {
            Dat_[mode].assign(str, length);

            return true;
        }

        std::map<clipboard_mode, std::string> Dat_;
        clipboard_opts* Opts_;
    };

    clipboard_c* clipboard_new(clipboard_opts* cb_opts) {
        return (clipboard_c*)(new Clip(cb_opts));
    }

    void clipboard_free(clipboard_c* cb) {
        delete (Clip*)cb;
    }

    void clipboard_clear(clipboard_c* cb, clipboard_mode mode) {
        ((Clip*)cb)->clear(mode);
    }

    bool clipboard_has_ownership(clipboard_c* cb, clipboard_mode mode) {
        return ((Clip*)cb)->hasOwnership(mode);
    }

    char* clipboard_text_ex(clipboard_c* cb, int* length, clipboard_mode mode) {
        int ll;

        if (!length) {
            length = &ll;
        }

        return ((Clip*)cb)->text(mode, length);
    }

    char* clipboard_text(clipboard_c* cb) {
        return clipboard_text_ex(cb, NULL, LCB_CLIPBOARD);
    }

    bool clipboard_set_text(clipboard_c* cb, const char* src) {
        return clipboard_set_text_ex(cb, src, -1, LCB_CLIPBOARD);
    }

    bool clipboard_set_text_ex(clipboard_c* cb, const char* src, int length, clipboard_mode mode) {
        if (length < 0) {
            length = strlen(src);
        }

        return ((Clip*)cb)->setText(mode, src, length);
    }
}
