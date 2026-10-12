local function applyLang(lang)
    currentLang = Lang[lang]
    Title.Text = currentLang.title
    optionButtons[1].Text = currentLang.normal
    optionButtons[2].Text = currentLang.sticky
    optionButtons[3].Text = currentLang.flick
    if unlocked then
        StartButton.Text = autoRunning and currentLang.stop or currentLang.start
    else
        StartButton.Text = currentLang.start
    end
    KeyTitle.Text = currentLang.enterKey
    ConfirmButton.Text = currentLang.confirm
end

--------------------------------------------------------------------
-- ربط الأزرار
--------------------------------------------------------------------

StartButton.MouseButton1Click:Connect(function()
    if unlocked then
        autoRunning = not autoRunning
        StartButton.Text = autoRunning and currentLang.stop or currentLang.start
        Status.Text = autoRunning and currentLang.unlocked or ""
        return
    end

    if not selectedMode then
        Status.Text = currentLang.pickFirst
        Status.TextColor3 = RED
        task.delay(2, function()
            if Status.Text == currentLang.pickFirst then
                Status.Text = ""
                Status.TextColor3 = WHITE
            end
        end)
        return
    end

    LangFrame.Visible = true
end)

EnButton.MouseButton1Click:Connect(function()
    applyLang("EN")
    LangFrame.Visible = false
    KeyFrame.Visible = true
end)

ArButton.MouseButton1Click:Connect(function()
    applyLang("AR")
    LangFrame.Visible = false
    KeyFrame.Visible = true
end)

ConfirmButton.MouseButton1Click:Connect(function()
    local key = string.lower(string.gsub(KeyBox.Text, "%s", ""))
    if key == "stark" then
        unlocked = true
        autoRunning = true
        KeyFrame.Visible = false
        Status.Text = currentLang.unlocked
        StartButton.Text = currentLang.stop
    else
        KeyMsg.Text = currentLang.wrongKey
        KeyBox.Text = ""
        task.delay(2, function() KeyMsg.Text = "" end)
    end
end)

--------------------------------------------------------------------
-- انتهاء السكربت بدون مشاكل
--------------------------------------------------------------------
