local run_service,tween_service,user_input_service = game:GetService('RunService'),game:GetService('TweenService'),game:GetService('UserInputService')
local plr = game:GetService('Players').LocalPlayer

local drag,id_input,method_input,speed_input,play_bttn = loadstring(game:HttpGet('https://raw.githubusercontent.com/Lisso-lab/Animation-ID-player/main/gui.lua'))() --

local motors = {}

local methods = {
    ['Tween'] = 4,
    ['Lerp'] = 2,
    ['CFrame'] = 0
}

local settings = {
    ['Method'] = 'Tween',
    ['Animation ID'] = '4846912064',
    ['Speed'] = .04
}

_G.run_player = false
wait(.5)
_G.run_player = true


local function make_draggable(gui)
    local dragging,drag_input,drag_start,start_pos,last_mouse_pos,last_goal_pos
    
    local drag_speed = 20

    local function lerp(a, b, m)
    	return a + (b - a) * m
    end

    local function update(dt)
    	if not start_pos then return end

        if not dragging and last_goal_pos then
            gui.Position = UDim2.new(start_pos.X.Scale,lerp(gui.Position.X.Offset,last_goal_pos.X.Offset,dt * drag_speed),start_pos.Y.Scale,lerp(gui.Position.Y.Offset,last_goal_pos.Y.Offset,dt * drag_speed))

            return 
        end

        local delta = (last_mouse_pos - user_input_service:GetMouseLocation())
        local x_goal,y_goal = (start_pos.X.Offset - delta.X),(start_pos.Y.Offset - delta.Y)

        last_goal_pos = UDim2.new(
            start_pos.X.Scale, x_goal,
            start_pos.Y.Scale, y_goal
        )

        gui.Position = UDim2.new(start_pos.X.Scale,lerp(gui.Position.X.Offset,x_goal,dt * drag_speed), start_pos.Y.Scale,lerp(gui.Position.Y.Offset,y_goal,dt * drag_speed))
    end
    
    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            drag_start = input.Position
            start_pos = gui.Position
            last_mouse_pos = user_input_service:GetMouseLocation()

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    gui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            drag_input = input
        end
    end)
    
    run_service['RenderStepped']:Connect(update)
end

local function get_animation(id)
    return game:GetObjects('rbxassetid://' ..id)[1]
end

local function on_focus_lost_id()
    local text = id_input.Text

    text = string.gsub(text,'%a%p%s','')
    print(text)

    if string.len(text) < 7 then
        id_input.Text = '4846912064'
    else
        id_input.Text = text
    end

    settings['Animation ID'] = id_input.Text
end

local function on_focus_lost_method()
    local text = method_input.text
    print(text)

    if not methods[text] then
        method_input.Text = 'Tween'
    else
        method_input.Text = text
    end

    settings['Method'] = method_input.Text
end

local function on_focus_lost_speed()
    local num = tonumber(speed_input.Text)
    print(num)

    if not num then
        speed_input.Text = .03
    else
        speed_input.Text =  num
    end

    settings['Speed'] = tonumber(speed_input.Text)
end

local swait do
    local stack = 0
    local step = run_service['RenderStepped']:wait()

    function swait(times)
        if times then
            local total = 0
            stack += times

            while stack >= step do
                step = run_service['RenderStepped']:wait()
                
                stack -= step
                total += step
            end
        else
            return run_service['RenderStepped']:wait()
        end
    end
end

local function play()
    local animation = get_animation(settings['Animation ID'])

    local char = plr.Character or plr.CharacterAdded:wait()
    local hum = char:FindFirstChildWhichIsA("Humanoid")

    local motors = {}
    
    for _,v in pairs(char:GetDescendants()) do
        if v:IsA('Motor6D') then motors[#motors+1] = v end
    end

    for _, anim_tracks in pairs(hum:GetPlayingAnimationTracks()) do
        anim_tracks:Stop()
    end
    
    do local animate: LocalScript = char:FindFirstChild("Animate")
        if animate then animate.Disabled = true end
    end
    
    if playing then
        playing = false
        wait(.5)
    end

    playing = true

    while wait() and playing do
        for _,frame in pairs(animation:GetKeyframes()) do
            for _,v in pairs(frame:GetDescendants()) do
    
                local current_motor do
                    for i=1,#motors do
                        if motors[i].Part1.Name ~= v.Name then continue end
    
                        current_motor = motors[i]
    
                        break
                    end
                end
    
                if not current_motor then continue end

                if settings['Method'] == 'Tween' or settings['Method'] == 'Lerp' then
    
                    local a,b = string.split(tostring(v.EasingStyle),'.'),string.split(tostring(v.EasingDirection),'.')
    
                    local tween_info = TweenInfo.new(
                        settings['Speed'],
                        Enum.EasingStyle[a[#a]],
                        Enum.EasingDirection[b[#b]],
                        0,false,0
                    )
                    
                    if settings['Method'] == 'Tween' then
                        (
                            tween_service:Create(
                                current_motor,
                                tween_info,
                                {Transform = v.CFrame}
                            )
                        ):Play()
                    else
                        current_motor.Transform = current_motor.Transform:lerp(
                            v.CFrame,
                            tween_service:GetValue(
                                .5,
                                Enum.EasingStyle[a[#a]],
                                Enum.EasingDirection[b[#b]]
                               )
                        )  
                    end
                else
                    current_motor.Transform = v.CFrame
                end
                
                if not playing then break end
            end
        
            if not playing then break end

            swait(settings['Speed'])
        end
    end
end

make_draggable(drag)

id_input.FocusLost:Connect(on_focus_lost_id)
method_input.FocusLost:Connect(on_focus_lost_method)
speed_input.FocusLost:Connect(on_focus_lost_speed)

play_bttn.MouseButton1Click:Connect(play)
