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

    static auto shash(const std::string& s) {
        return XXH64(s.c_str(), s.length(), 0);
    }

    using ui128 = std::pair<uint64_t, uint64_t>;

    static ui128 fhash(const std::string& p) {
        return std::make_pair(shash(p), shash(readf(p)));
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

    using ProcID = ui128;

    struct Context {
        const std::string where;
        std::map<ProcID, std::shared_ptr<Proc>> running;

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
            std::set<ProcID> cur;

            for (const auto& entry : std::filesystem::directory_iterator(where)) {
                auto p = entry.path().string() + "/run";

                try {
                    auto md5 = fhash(p);
                    auto& proc = running[md5];

                    if (proc.get()) {
                        // already running
                    } else {
                        proc = std::make_shared<Proc>(p);
                    }

                    cur.insert(md5);
                } catch (...) {
                    log("skip " + p + ": " + currentException());
                }
            }

            std::vector<ProcID> dead;

            for (auto& item : running) {
                auto md5 = item.first;
                auto proc = item.second;

                if (cur.find(md5) == cur.end()) {
                    proc->terminate();
                }

                if (proc->alive()) {
                    // alive
                } else {
                    dead.push_back(md5);
                }
            }

            for (auto d : dead) {
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
