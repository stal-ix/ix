#include "libclipboard.h"

#include <SDL2/SDL.h>
#include <SDL2/SDL_clipboard.h>

#include <stdlib.h>
#include <string.h>

#include <map>
#include <mutex>
#include <string>
#include <stdexcept>

namespace {
    struct Clip {
        virtual ~Clip() {
        }

        virtual void clear(clipboard_mode mode) = 0;
        virtual bool hasOwnership(clipboard_mode mode) = 0;
        virtual char* text(clipboard_mode mode, int* length) = 0;
        virtual bool setText(clipboard_mode mode, const char* str, size_t length) = 0;
    };

    struct SDLClip: public Clip {
        SDLClip() {
            if (SDL_Init(SDL_INIT_VIDEO) != 0) {
                throw std::runtime_error(SDL_GetError());
            }
        }

        virtual ~SDLClip() {
        }

        void clear(clipboard_mode mode) override {
            setText(mode, "", 0);
        }

        bool hasOwnership(clipboard_mode) override {
            return true;
        }

        char* text(clipboard_mode, int* length) override {
            if (auto t = SDL_GetClipboardText(); t) {
                std::string ret = t;

                SDL_free(t);

                if (ret.length()) {
                    return strdup(ret.c_str());
                }
            }

            return nullptr;
        }

        bool setText(clipboard_mode, const char* str, size_t length) override {
            std::string t(str, length);

            return SDL_SetClipboardText(t.c_str()) == 0;
        }
    };

    struct InMemClip: public Clip {
        InMemClip(clipboard_opts* opts)
            : Opts_(opts)
        {
        }

        virtual ~InMemClip() {
        }

        void clear(clipboard_mode mode) override {
            std::lock_guard<std::mutex> guard(Lock_);

            if (auto it = Dat_.find(mode); it != Dat_.end()) {
                it->second.clear();
            }
        }

        bool hasOwnership(clipboard_mode mode) override {
            std::lock_guard<std::mutex> guard(Lock_);

            return Dat_.find(mode) != Dat_.end();
        }

        char* text(clipboard_mode mode, int* length) override {
            std::lock_guard<std::mutex> guard(Lock_);

            if (auto it = Dat_.find(mode); it != Dat_.end()) {
                *length = it->second.size();

                return strdup(it->second.c_str());
            }

            return nullptr;
        }

        bool setText(clipboard_mode mode, const char* str, size_t length) override {
            std::lock_guard<std::mutex> guard(Lock_);

            Dat_[mode].assign(str, length);

            return true;
        }

    private:
        std::mutex Lock_;
        std::map<clipboard_mode, std::string> Dat_;
        clipboard_opts* Opts_;
    };

    static inline Clip* constructClip(clipboard_opts* cb_opts) {
        try {
            return new SDLClip();
        } catch (...) {
        }

        return new InMemClip(cb_opts);
    }
}

extern "C" {
    clipboard_c* clipboard_new(clipboard_opts* cb_opts) {
        return (clipboard_c*)constructClip(cb_opts);
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
