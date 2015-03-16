function SelectWord()
    editor.SelectionStart = editor:WordStartPosition(editor.CurrentPos, true)
    editor.SelectionEnd   = editor:WordEndPosition(editor.CurrentPos, true)
end


function SortLines_(asc)
    local sel = editor:GetSelText()
    if #sel == 0 then return end
    local eol = string.match(sel, "\n$")

    local lines = function(str)
        local t = {}
        local i, lstr = 1, #str
        while i <= lstr do
            local x, y = string.find(str, "\r?\n", i)
            if x then t[#t + 1] = string.sub(str, i, x - 1)
            else break
            end
            i = y + 1
        end
        if i <= lstr then
            t[#t + 1] = string.sub(str, i)
        end
        return t
    end

    local buf = lines(sel)
    table.sort(buf, function(a, b)
        if asc then
            return a < b
        else
            return a > b
        end
    end)

    local out = table.concat(buf, "\n")
    if eol then
        out = out.."\n"
    end
    editor:ReplaceSel(out)
end


function SortLines()
    SortLines_(true)
end

function SortLinesReverse()
    SortLines_(false)
end

function ResetZoom()
    editor.Zoom = 0
end


--function LinesJoin()
--    if #(editor:GetSelText()) == 0 then
--        startLineNumber = editor:LineFromPosition(editor.CurrentPos)
--        lastLineNumber = editor:LineFromPosition(editor.CurrentPos) + 1
--    end
--
--    if editor.LineCount < lastLineNumber then
--        return
--    end
--
--    if lastLineNumber <= startLineNumber then
--        return
--    end
--
--    lines
--    joinedLine = editor:GetLine(startLineNumber)
--
--
--    string.gsub(str, pattern, repl, n)
--
--    editor:LinesJoin()
--end


--function DuplicateLine()
--    local curLineNumber = editor:LineFromPosition(editor.CurrentPos)
--    local line = editor:GetCurLine()
--    editor:SetEmptySelection(editor.CurrentPos)
--
--    local x = editor.CurrentPos -  editor:PositionFromLine(curLineNumber)
--    local front = string.sub(line, 0, x)
--    local back = string.sub(line, x + 1, -1)
--
--    if not string.find(back, "\n") then
--        back = back .. "\n"
--    end
--    editor:ReplaceSel(back .. front)
--end
--
--
--function DupInc()
--    --[[
--    10進数 連番生成マクロ
--
--    ★動作仕様
--    ↓次のようなテキストがある場合（ | がカーソル位置とします）
--    --------------------------------------------------
--    copy  original.txt  test|08.txt
--    --------------------------------------------------
--    　　　　　↓このマクロを実行すると、↓
--    --------------------------------------------------
--    copy  original.txt  test08.txt
--    copy  original.txt  test|09.txt
--    --------------------------------------------------
--    という１行が増えます。そのまま何度もマクロの実行を続けると、
--    --------------------------------------------------
--    copy  original.txt  test08.txt
--    copy  original.txt  test09.txt
--    copy  original.txt  test10.txt
--    copy  original.txt  test|11.txt
--    --------------------------------------------------
--    という具合に。。。
--
--    なお、「カーソル位置より右の数値」が + 1 した値の行が増えていきます。
--    「カーソル位置より左の文字」は、たとえ数値であろうと無視して、そのままとなります。
--
--    つまり、↓にて | の位置にカーソルがある場合は
--    --------------------------------------------------
--    copy  original.txt  test0|9.txt
--    --------------------------------------------------
--    　　　　　↓マクロを２回実行↓
--    --------------------------------------------------
--    copy  original.txt  test09.txt
--    copy  original.txt  test010.txt
--    copy  original.txt  test0|11.txt
--    --------------------------------------------------
--    となります。
--
--    DuplicateLine()
--
--    editor.SelectionStart = editor.CurrentPos
--    editor.SelectionEnd = editor:WordEndPosition(editor.CurrentPos, true)
--
--    local ns = string.match(editor:GetSelText(), "^%d+")
--    if not ns then
--        return
--    end
--
--    function parse_int10(s)
--        if string.match(s, "^0*$") then
--            return 0
--        end
--
--        m = string.match(s, "^0*([1-9][0-9]*)")
--        return tonumber(m)
--    end
--
--    local new_ns = tostring(parse_int10(ns) + 1)
--
--    if #new_ns < #ns then
--        new_ns = string.rep("0", #ns - #new_ns) .. new_ns
--    end
--
--    editor.SelectionEnd = editor.SelectionStart + #ns
--
--    editor:ReplaceSel(new_ns)
--    editor:SetEmptySelection(editor.CurrentPos - #new_ns)
--    ]]
--end