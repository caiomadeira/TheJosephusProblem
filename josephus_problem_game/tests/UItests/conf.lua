-- config test file

resolution1 = {
    width = 1280,
    height = 720,
}

resolution2 = {
    width = 1920,
    height = 1080,
}

resolution3 = {
    width = 1366,
    height = 768,
}

function love.conf(t)

    t.window.title = "UI tests"
    t.window.width = resolution3.width      
    t.window.height = resolution3.height
    t.window.fullscreen = false
end