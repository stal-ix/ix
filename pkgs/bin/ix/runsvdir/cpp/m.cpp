#include <map>
#include <set>
#include <string>
#include <vector>
#include <time.h>
#include <fstream>
#include <sstream>
#include <iostream>
#include <unistd.h>
#include <exception>
#include <filesystem>
#include <xxhash.h>

namespace {
    static void log0(const std::string& s) {
        write(2, s.c_str(), s.length());
    }

    static void log(const std::string& s) {
        log0(s + "\n");
    }

    static inline std::string readf(const std::string& path) {
        std::ostringstream buf;
        std::ifstream input(path);

        if (!input) {
            throw std::runtime_error("can not open " + path);
        }

        buf << input.rdbuf();

        return buf.str();
    }

    static std::string currentException() {
        try {
            throw;
        } catch (const std::exception& e) {
            return e.what();
        }

        return "unknown error";
    }

    static std::string shash(const std::string& s) {
        return std::to_string(XXH64(s.c_str(), s.length(), 0));
    }

    static std::string fhash(const std::string& p) {
        return shash(p) + "|" + shash(readf(p));
    }

    struct Proc {
        Proc(const std::string& p) {
        }

        void terminate() {
        }

        bool alive() {
            return true;
        }
    };

    struct Context {
        const std::string where;
        std::map<std::string, std::shared_ptr<Proc>> running;

        Context(const std::string& where_)
            : where(where_)
        {
        }

        void run() {
            while (true) {
                try {
                    step();
                } catch (...) {
                    log("step error " + currentException());
                }

                sleep(1);
            }
        }

        void step() {
            std::set<std::string> cur;

            for (const auto& entry : std::filesystem::directory_iterator(where)) {
                auto p = entry.path().string() + "/run";

                try {
                    auto md5 = fhash(p);
                    auto& proc = running[md5];

                    if (proc.get()) {
                        log(p + " already running as " + md5);
                    } else {
                        log("spawn " + p + " as " + md5);
                        proc = std::make_shared<Proc>(p);
                    }

                    cur.insert(md5);
                } catch (...) {
                    log("skip " + p + ": " + currentException());
                }
            }

            std::vector<std::string> dead;

            for (auto& item : running) {
                auto md5 = item.first;
                auto proc = item.second;

                if (cur.find(md5) == cur.end()) {
                    log(md5 + " stale");
                    proc->terminate();
                }

                if (proc->alive()) {
                    log(md5 + " alive");
                } else {
                    log(md5 + " dead");
                    dead.push_back(md5);
                }
            }

            for (auto d : dead) {
                log("erase dead " + d);
                running.erase(d);
            }
        }
    };
}

int main(int argc, char** argv) {
    if (argc < 2) {
        abort();
    }

    if (!argv[1]) {
        abort();
    }

    Context(argv[1]).run();
}
