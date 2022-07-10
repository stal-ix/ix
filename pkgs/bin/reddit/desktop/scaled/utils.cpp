#include "utils.h"
#include "imgui.h"
#include "imgui_internal.h"
#include "images/sprite_reddit.h"
#include "images/reddit_icon_256.h"
#include "images/stricken.h"
#include "fonts/fonts.h"
#include "macros.h"

#include "misc/freetype/imgui_freetype.h"
#include <array>
#include <fmt/format.h>
#include <boost/archive/iterators/binary_from_base64.hpp>
#include <boost/archive/iterators/base64_from_binary.hpp>
#include <boost/archive/iterators/transform_width.hpp>
#include <boost/algorithm/string.hpp>
#include <chrono>
#include <iostream>
#include <locale>
#include <codecvt>

#ifdef RD_WINDOWS
#include <windows.h>
#include <shellapi.h>
#include <shlobj.h>
#include <shlwapi.h>
#include <objbase.h>
#else
#include <boost/process/spawn.hpp>
#include <boost/process/search_path.hpp>
#include <unistd.h>
#include <sys/types.h>
#include <pwd.h>
#endif

#if defined(__GNUC__) || defined(__clang__)
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wvla"
#pragma GCC diagnostic ignored "-Wunused-but-set-variable"
#pragma GCC diagnostic ignored "-Wsign-compare"
#endif

#ifdef _MSC_VER
#pragma warning( push )
#pragma warning( disable : 4100 ) //TODO: find out warning numbers of MSVC
#endif

#define STB_IMAGE_IMPLEMENTATION
#include <stb_image.h>
#define IIR_GAUSS_BLUR_IMPLEMENTATION
#include "iir_gauss_blur.h"

#ifdef _MSC_VER
#pragma warning( pop )
#endif

#if defined(__GNUC__) || defined(__clang__)
#pragma GCC diagnostic pop
#endif

namespace {
    std::map<std::string, std::tuple<float,float,float,float>> thumbnailsCoordinates = {
        {"image",   {0.f,310.f          ,140.f,105.f}},
        {"default", {0.f,310.f+(148.f)  ,140.f,105.f}},
        {"nsfw",    {0.f,310.f+(290.f)  ,140.f,105.f}},
        {"spoiler", {0.f,310.f+(440.f)  ,140.f,105.f}},
        {"self",    {0.f,310.f+(585.f)  ,140.f,105.f}},
        {"reddit",  {0.f,310.f+(445.f)  ,140.f,105.f}}, //same as "spoiler"
    };

    struct STBImageDeleter
    {
        void operator()(stbi_uc *data)
        {
            if(data)
            {
                stbi_image_free(data);
            }
        }
    };

    //size_t seguiemjFileDataSize = 0;
    //void* seguiemjFileData = nullptr;
    //size_t notoColorEmojiFileDataSize = 0;
    //void* notoColorEmojiFileData = nullptr;
    size_t twColorEmojiFileDataSize = 0;
    void* twColorEmojiFileData = nullptr;
    size_t fontAwesomeFileDataSize = 0;
    void* fontAwesomeFileData = nullptr;
}

ResizableGLImageSharedPtr Utils::redditDefaultSprites;

ImFont* Utils::AddFont(const std::filesystem::path& fontsFolder,
                       const std::string& font,
                       float fontSize)
{
    fontSize *= 2;

    static ImFontConfig fontAwesomeConfig;
    fontAwesomeConfig.MergeMode = true;
    fontAwesomeConfig.GlyphMinAdvanceX = fontSize; // Use if you want to make the icon monospaced
    fontAwesomeConfig.FontDataOwnedByAtlas = false;
    static const ImWchar icon_ranges[] = { ICON_MIN_FA, ICON_MAX_FA, 0 };
    static const ImWchar romanian_ranges[] = { 0x0100, 0x017F,
                                               0x0180, 0x024F,
                                               0 };

    ImFontConfig config;
    config.MergeMode = true;

    auto fontFile = fontsFolder / font;

    if(!std::filesystem::exists(fontFile)) throw std::runtime_error(
                fmt::format("Font file {} does not exists",fontFile.string()));

    auto fontFilenameString = fontFile.string();
    const char* fontFilename = fontFilenameString.c_str();


    auto fontData = ImGui::GetIO().Fonts->AddFontFromFileTTF(fontFilename, fontSize);
    if(!fontData) throw std::runtime_error(
                fmt::format("Unable to load font {}",fontFile.string()));
    ImGui::GetIO().Fonts->AddFontFromFileTTF(fontFilename, fontSize,&config,ImGui::GetIO().Fonts->GetGlyphRangesChineseFull());
    ImGui::GetIO().Fonts->AddFontFromFileTTF(fontFilename, fontSize,&config,ImGui::GetIO().Fonts->GetGlyphRangesCyrillic());
    ImGui::GetIO().Fonts->AddFontFromFileTTF(fontFilename, fontSize,&config,ImGui::GetIO().Fonts->GetGlyphRangesKorean());
    ImGui::GetIO().Fonts->AddFontFromFileTTF(fontFilename, fontSize,&config,ImGui::GetIO().Fonts->GetGlyphRangesJapanese());
    ImGui::GetIO().Fonts->AddFontFromFileTTF(fontFilename, fontSize,&config,ImGui::GetIO().Fonts->GetGlyphRangesThai());
    ImGui::GetIO().Fonts->AddFontFromFileTTF(fontFilename, fontSize,&config,ImGui::GetIO().Fonts->GetGlyphRangesVietnamese());
    ImGui::GetIO().Fonts->AddFontFromFileTTF(fontFilename, fontSize,&config,romanian_ranges);

    static ImFontConfig emojiConfig;
    emojiConfig.MergeMode = true;
    emojiConfig.FontBuilderFlags |= ImGuiFreeTypeBuilderFlags_LoadColor;
    emojiConfig.FontBuilderFlags |= ImGuiFreeTypeBuilderFlags_Bitmap;
    emojiConfig.OversampleH = emojiConfig.OversampleV = 1;
    emojiConfig.FontDataOwnedByAtlas = false;
    //emojiConfig.GlyphMinAdvanceX = fontSize;
    static const ImWchar emoji_icon_ranges[] = { 0x1, 0x1FFFF,
                                                 0 };

    /*ImGui::GetIO().Fonts->AddFontFromMemoryTTF(seguiemjFileData,seguiemjFileDataSize, fontSize,
                                                         &emojiConfig,emoji_icon_ranges);*/
    ImGui::GetIO().Fonts->AddFontFromMemoryTTF(twColorEmojiFileData, twColorEmojiFileDataSize, fontSize,
                                                         &emojiConfig,emoji_icon_ranges);
    return ImGui::GetIO().Fonts->AddFontFromMemoryTTF(fontAwesomeFileData, fontAwesomeFileDataSize, fontSize,
                                                         &fontAwesomeConfig, icon_ranges);
}

void Utils::LoadFonts(const std::filesystem::path& executablePath)
{
#ifdef RD_WINDOWS
    const float normalFontSize = 18.f;
    const float bigFontSize = 22.f;
#else
    const float normalFontSize = 20.f;
    const float bigFontSize = 24.f;
#endif // WIN

#ifdef FONTS_DIRECTORY
    UNUSED(executablePath);
    auto fontsFolder = std::filesystem::path(FONTS_DIRECTORY) / "fonts";
#else
    auto fontsFolder = executablePath / "fonts";
#endif
    if(!std::filesystem::exists(fontsFolder)) throw std::runtime_error(
                fmt::format("Fonts folder does not exists ({})",fontsFolder.string()));

    //auto seguiemjFile = (fontsFolder / "seguiemj.ttf").string();
    auto twColorEmojiFile = (fontsFolder / "Twemoji_Mozilla.ttf").string();
    auto fontAwesomeFile = (fontsFolder / FONT_ICON_FILE_NAME_FA).string();

    //seguiemjFileData = ImFileLoadToMemory(seguiemjFile.c_str(), "rb", &seguiemjFileDataSize, 0);
    twColorEmojiFileData = ImFileLoadToMemory(twColorEmojiFile.c_str(), "rb", &twColorEmojiFileDataSize, 0);
    fontAwesomeFileData = ImFileLoadToMemory(fontAwesomeFile.c_str(), "rb", &fontAwesomeFileDataSize, 0);

    AddFont(fontsFolder, "NotoSans-Bold.ttf", normalFontSize);
    AddFont(fontsFolder, "NotoSans-Italic.ttf", normalFontSize);
    AddFont(fontsFolder, "NotoSans-Light.ttf", normalFontSize);
    AddFont(fontsFolder, "NotoSans-LightItalic.ttf", normalFontSize);
    AddFont(fontsFolder, "NotoSans-Medium.ttf", normalFontSize);
    AddFont(fontsFolder, "NotoSans-Regular.ttf", normalFontSize);
    AddFont(fontsFolder, "NotoSans-Medium.ttf", bigFontSize);
    AddFont(fontsFolder, "NotoMono-Regular.ttf", normalFontSize);
    //ImGuiFreeType::BuildFontAtlas(ImGui::GetIO().Fonts, ImGuiFreeType::LoadColor);
}
void Utils::DeleteFonts()
{
    free(twColorEmojiFileData);
    free(fontAwesomeFileData);
}
int Utils::GetFontIndex(Fonts font)
{
    return static_cast<int>(font);
}

std::string Utils::convertSizeToHuman(uint64_t size)
{
    const std::array<std::string,6> suffix = {"B", "KB", "MB", "GB", "TB"};
    const auto length = suffix.size();
    size_t i = 0;
    double dblBytes = static_cast<double>(size);

    if (size >= 1024) {
        for (i = 0; (size / 1024) > 0 && i<length-1; i++, size /= 1024)
            dblBytes = size / 1024.0;
    }

    if(size == 0)
    {

    }

    auto xx = fmt::format("{0:.0f} {1:s}",dblBytes, suffix[i]);
    return xx;
}

std::string Utils::decode64(const std::string &val)
{
    using namespace boost::archive::iterators;
    using It = transform_width<binary_from_base64<std::string::const_iterator>, 8, 6>;
    return boost::algorithm::trim_right_copy_if(std::string(It(std::begin(val)), It(std::end(val))), [](char c) {
       return c == '\0';
    });
}
std::string Utils::encode64(const std::string &val)
{
    using namespace boost::archive::iterators;
    using It = base64_from_binary<transform_width<std::string::const_iterator, 6, 8>>;
    auto tmp = std::string(It(std::begin(val)), It(std::end(val)));
    return tmp.append((3 - val.size() % 3) % 3, '=');
}
void Utils::LoadRedditImages()
{
    int width, height, channels;
    auto data = decodeImageData(sprite_reddit_png,sprite_reddit_png_len,&width,&height,&channels);
    auto sprites = Utils::loadImage(data.get(),width,height,STBI_rgb_alpha);
    redditDefaultSprites.reset(sprites.release());
}
void Utils::ReleaseRedditImages()
{
    redditDefaultSprites.reset();
}
ResizableGLImageSharedPtr Utils::GetRedditDefaultSprites()
{
    return redditDefaultSprites;
}
/*ResizableGLImagePtr Utils::GetRedditSpriteSubimage(int x, int y, int width, int height)
{
    if(!redditDefaultSprites || redditDefaultSprites->textureId == 0) return ResizableGLImagePtr();

    auto image = std::make_unique<ResizableGLImage>();
    GLuint image_texture;
    glGenTextures(1, &image_texture);
    glBindTexture(GL_TEXTURE_2D, image_texture);

    // Setup filtering parameters for display
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

    // Upload pixels into texture
#if defined(GL_UNPACK_ROW_LENGTH) && !defined(__EMSCRIPTEN__)
    glPixelStorei(GL_UNPACK_ROW_LENGTH, 0);
#endif
    //glTexStorage2D(GL_TEXTURE_2D, 0, GL_RGBA, width, height);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, width, height,
                 0, GL_RGBA, GL_UNSIGNED_BYTE, nullptr);

    glCopyImageSubData(redditDefaultSprites->textureId, GL_TEXTURE_2D, 0, x, y, 0,
                       image_texture, GL_TEXTURE_2D, 0, 0, 0, 0,
                       width, height, 1);

    image->width = width;
    image->height = height;
    image->channels = STBI_rgb_alpha;
    image->textureId = image_texture;

    return image;
}*/
ResizableGLImagePtr Utils::GetApplicationIcon()
{
    int width =0;
    int height = 0;
    int channels = 0;
    auto data = decodeImageData(_reddit_icon_256_png,_reddit_icon_256_png_len,&width,&height,&channels);
    return Utils::loadImage(data.get(),width,height,STBI_rgb_alpha);
}
ResizableGLImagePtr Utils::GetStrickenImage()
{
    int width =0;
    int height = 0;
    int channels = 0;
    auto data = decodeImageData(_icons_stricken_png,_icons_stricken_png_len,&width,&height,&channels);
    return Utils::loadImage(data.get(),width,height,STBI_rgb_alpha);
}
StandardRedditThumbnail Utils::GetRedditHeader()
{
    float x = 0.f;
    float y = 1323.f;
    float width = 120.f;
    float height = 40.f;
    return StandardRedditThumbnail(
                ImVec2(x/redditDefaultSprites->width, y/redditDefaultSprites->height),
                ImVec2((x+width)/redditDefaultSprites->width, (y+height)/redditDefaultSprites->height),
                ImVec2(width,height)
                );
}
std::optional<StandardRedditThumbnail> Utils::GetRedditThumbnail(const std::string& kind)
{
    auto thumbnailIt = thumbnailsCoordinates.find(kind);
    if(thumbnailIt == thumbnailsCoordinates.end())
    {
        return std::optional<StandardRedditThumbnail>();
    }

    float x = std::get<0>(thumbnailIt->second);
    float y = std::get<1>(thumbnailIt->second);
    float width = std::get<2>(thumbnailIt->second);
    float height = std::get<3>(thumbnailIt->second);

    return std::make_optional<StandardRedditThumbnail>(
                ImVec2(x/redditDefaultSprites->width, y/redditDefaultSprites->height),
                ImVec2((x+width)/redditDefaultSprites->width, (y+height)/redditDefaultSprites->height),
                ImVec2(width,height)
                );
}
Utils::STBImagePtr Utils::decodeImageData(stbi_uc const *buffer, int len, int *x, int *y, int *channels_in_file)
{
    return STBImagePtr(stbi_load_from_memory(buffer,len,x,y,channels_in_file,STBI_rgb_alpha),STBImageDeleter());
}
Utils::STBImagePtr Utils::decodeGifData(stbi_uc const *buffer, int len, int *x, int *y,
                               int *channels_in_file, int *count, int** delays)
{
    return STBImagePtr(stbi_load_gif_from_memory(buffer, len, delays, x, y, count, channels_in_file, STBI_rgb_alpha),STBImageDeleter());
}
ResizableGLImagePtr Utils::loadBlurredImage(unsigned char* data, int width, int height, int channels)
{
    if(!data) return ResizableGLImagePtr();

    float sigma = 15;
    iir_gauss_blur(width, height, channels, data, sigma);
    /*GLuint FramebufferName = 0;
    glGenFramebuffers(1, &FramebufferName);
    glBindFramebuffer(GL_FRAMEBUFFER, FramebufferName);*/

    auto image = loadImage(data,width,height,channels);

    /*glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D,
                           image->textureId, 0);
    glBindFramebuffer(GL_FRAMEBUFFER, FramebufferName);
    glViewport( 0, 0, width, height );
    glPushMatrix();  //Make sure our transformations don't affect any other transformations in other code
    glOrtho(0, width, 0, height, -1, 1);
    glTranslatef(width/6, height/3, 0.0f);  //Translate rectangle to its assigned x and y position
    glColor3f(1, 1, 1);
    glBegin(GL_LINE_LOOP);   //We want to draw a quad, i.e. shape with four sides
        glVertex2f(0,0);
        glVertex2f(0, height/3);
        glVertex2f(2*width/3, height/3);
        glVertex2f(2*width/3, 0);
    glEnd();
    glPopMatrix();
    glBindFramebuffer(GL_FRAMEBUFFER, 0);
    glDeleteFramebuffers(1, &FramebufferName);*/

    return image;
}
ResizableGLImagePtr Utils::loadImage(unsigned char* data, int width, int height, int channels)
{
    if(!data) return ResizableGLImagePtr();
    auto image = std::make_unique<ResizableGLImage>();

    //https://github.com/ocornut/imgui/wiki/Image-Loading-and-Displaying-Examples
    GLuint image_texture;
    glGenTextures(1, &image_texture);
    glBindTexture(GL_TEXTURE_2D, image_texture);

    // Setup filtering parameters for display
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE); // This is required on WebGL for non power-of-two textures
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE); // Same

    // Upload pixels into texture
#if defined(GL_UNPACK_ROW_LENGTH) && !defined(__EMSCRIPTEN__)
    glPixelStorei(GL_UNPACK_ROW_LENGTH, 0);
#endif
    if(channels == 3)
    {
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, width, height,
                     0, GL_RGB, GL_UNSIGNED_BYTE, data);
    }
    else if (channels == 4)
    {
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, width, height,
                     0, GL_RGBA, GL_UNSIGNED_BYTE, data);
    }
    glBindTexture(GL_TEXTURE_2D, 0);
    image->width = width;
    image->height = height;
    image->channels = channels;
    image->textureId = image_texture;
    return image;
}

std::string Utils::getHumanReadableNumber(int number)
{
    std::string fmt_num;
    if(number < 10000 )
    {
        fmt_num = fmt::format("{}",number);
    }
    else if(number < 100'000 )
    {
        fmt_num = fmt::format("{:.1f}k",number/1000.0);
    }
    else
    {
        fmt_num = fmt::format("{:.0f}k",number/1000.0);
    }
    return fmt_num;
}
std::string Utils::getHumanReadableTimeAgo(uint64_t time, bool fuzzySeconds)
{
    auto diff_time = std::time(nullptr) - time;
    std::chrono::seconds diff(diff_time);
    typedef std::chrono::duration<int, std::ratio<86400*365>> years;
    const auto y = std::chrono::duration_cast<years>(diff);
    if(y.count() > 0)
    {
        if(y.count() == 1) return "a year ago";
        return fmt::format("{} years ago", y.count());
    }
    typedef std::chrono::duration<int, std::ratio<86400>> days;
    const auto d = std::chrono::duration_cast<days>(diff);
    if(d.count() > 0)
    {
        if(d.count() == 1) return "yesterday";
        return fmt::format("{} days ago", d.count());
    }
    const auto h = std::chrono::duration_cast<std::chrono::hours>(diff);
    if(h.count() > 0)
    {
        if(h.count() == 1) return "1 hour ago";
        return fmt::format("{} hours ago", h.count());
    }
    const auto m = std::chrono::duration_cast<std::chrono::minutes>(diff);
    if(m.count() > 0)
    {
        if(m.count() == 1) return "1 minute ago";
        return fmt::format("{} minutes ago", m.count());
    }
    if(fuzzySeconds)
    {
        return "just now";
    }
    const auto s = std::chrono::duration_cast<std::chrono::seconds>(diff);
    if(s.count() > 0)
    {
        if(s.count() == 1) return "1 second ago";
        return fmt::format("{} seconds ago", s.count());
    }
    const auto ms = std::chrono::duration_cast<std::chrono::milliseconds>(diff);
    return fmt::format("{} miliseconds ago", ms.count());
}
std::string Utils::formatDuration(std::chrono::seconds diff)
{
    std::string text;
    const auto h = std::chrono::duration_cast<std::chrono::hours>(diff);
    auto hours_count = h.count();
    if(hours_count > 0)
    {
        if(hours_count < 10) text="0";
        text+= std::to_string(hours_count) + "h:";
    }
    diff = diff - h;
    const auto m = std::chrono::duration_cast<std::chrono::minutes>(diff);
    auto min_count = m.count();
    if(hours_count > 0 || min_count > 0)
    {
        if(min_count < 10) text+="0";
        text += std::to_string(min_count) + "m:";
    }
    diff = diff - m;
    auto sec_count = diff.count();
    if(sec_count < 10) text+="0";
    text += std::to_string(sec_count)+"s";
    return text;
}
void Utils::openInBrowser(const std::string& url)
{

#ifdef RD_WINDOWS
    SHELLEXECUTEINFO ShExecInfo;
    ShExecInfo.cbSize = sizeof(SHELLEXECUTEINFO);
    ShExecInfo.fMask = NULL;
    ShExecInfo.hwnd = NULL;
    ShExecInfo.lpVerb = NULL;
    ShExecInfo.lpFile = url.c_str();
    ShExecInfo.lpParameters = NULL;
    ShExecInfo.lpDirectory = NULL;
    ShExecInfo.nShow = SW_MAXIMIZE;
    ShExecInfo.hInstApp = NULL;

    ShellExecuteEx(&ShExecInfo);
    //ShellExecute(NULL, L"open", url.c_str(), NULL, NULL, 0);
#else
    auto browser = boost::process::search_path("xdg-open");
    if (browser.empty())
    {
        std::cerr << "Cannot find xdg-open in PATH" << std::endl;
        return;
    }
    boost::process::spawn(browser, url);
#endif
}
ImVec4 Utils::GetDownVoteColor()
{
    return ImVec4(0.58f,0.58f,0.96f,1.0f);
}
ImVec4 Utils::GetUpVoteColor()
{
    return ImVec4(1.0f,0.54f,0.0f,1.0f);
}
std::string Utils::CalculateScore(int& score,Voted originalVote,Voted newVote)
{
    if(originalVote != newVote)
    {
        switch(newVote)
        {
        case Voted::DownVoted:
            score -= (originalVote == Voted::UpVoted) ? 2 : 1;
            break;
        case Voted::UpVoted:
            score += (originalVote == Voted::DownVoted) ? 2 : 1;
            break;
        case Voted::NotVoted:
            score += (originalVote == Voted::DownVoted) ? 1 : -1;
            break;
        }
    }
    return Utils::getHumanReadableNumber(score);
}

std::filesystem::path Utils::GetAppConfigFolder()
{
    std::filesystem::path homePath;
    std::string relativeConfigFolder;
#ifdef RD_WINDOWS
    char homeDirStr[MAX_PATH];
    if (SUCCEEDED(SHGetFolderPath(NULL, CSIDL_APPDATA, NULL, 0, homeDirStr)))
    {
        homePath = homeDirStr;
    }
    relativeConfigFolder = "reddit_desktop";
#else
    auto pwd = getpwuid(getuid());
    if (pwd)
    {
        homePath = pwd->pw_dir;
    }
    else
    {
        // try the $HOME environment variable
        homePath = getenv("HOME");
    }
    relativeConfigFolder = ".config/reddit_desktop";
#endif


    if(homePath.empty())
    {
        homePath = "./";
    }

    std::filesystem::path  configFolder = homePath / relativeConfigFolder;
    std::filesystem::create_directories(configFolder);
    return configFolder;
}

ImVec4 Utils::GetHTMLColor(const std::string& strColor)
{
    ImVec4 color{5.f,5.f,5.f,1.f};
    auto copiedColor = boost::trim_copy(strColor);
    if(copiedColor.empty()) return color;
    if(copiedColor[0] == '#')
    {
        copiedColor.erase(0,1);
    }

    if(copiedColor.length() < 6)
    {
        copiedColor.append(6-copiedColor.length(),'0');
    }
    if(copiedColor.length() < 8)
    {
        copiedColor.append(8-copiedColor.length(),'F');
    }
    copiedColor = copiedColor.substr(0,8);
    BOOST_ASSERT_MSG(copiedColor.length() == 8, "HTML Color is parsed wrong");
    try
    {
        color.x = std::stoi(copiedColor.substr(0,2), nullptr, 16) / 255.f;
        color.y = std::stoi(copiedColor.substr(2,2), nullptr, 16) / 255.f;
        color.z = std::stoi(copiedColor.substr(4,2), nullptr, 16) / 255.f;
        color.w = std::stoi(copiedColor.substr(5,2), nullptr, 16) / 255.f;
    }
    catch(const std::exception& ex)
    {}
    return color;
}
