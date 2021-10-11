show = true

for l in io.lines() do
    if l:find("tkinter") ~= nil then
        show = false
    end

    if l:find("binasc") ~= nil then
        show = true
    end

    if l:len() == 0 then
        goto continue
    end

    if l:sub(1, 1) ~= '#' then
        print(l)

        goto continue
    end

    if l:sub(2, 2) == ' ' then
        goto continue
    end

    if l:find("SSL") ~= nil then
        goto continue
    end

    if l:find("#*", 1, true) ~= nil then
        goto continue
    end

    if l:find("\\") ~= nil then
        goto continue
    end

    if show then
        print(l:sub(2, -1))
    end

    ::continue::
end
