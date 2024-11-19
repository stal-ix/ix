#include <map>
#include <set>
#include <string>
#include <vector>
#include <fstream>
#include <sstream>
#include <iostream>
#include <stdexcept>
#include <exception>
#include <filesystem>

#include <time.h>
#include <spawn.h>
#include <signal.h>
#include <unistd.h>
#include <sys/wait.h>

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
        int pid;

        Proc(const std::string& p) {
            char* cmd[] = {
                (char*)p.c_str(),
                0,
            };

            if (posix_spawnp(&pid, cmd[0], 0, 0, cmd, 0)) {
                throw std::runtime_error("can not spaawn " + p);
            }
        }

        void terminate() {
            kill(pid, SIGTERM);
        }

        bool alive() {
            return kill(pid, 0) == 0;
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

            int status;

            while (waitpid(-1, &status, WNOHANG) > 0) {
            }
        }
    };
}

int main(int argc, char** argv) {
    if (argc < 3) {
        abort();
    }

    if (!argv[2]) {
        abort();
    }

    Context(argv[2]).run();
}
