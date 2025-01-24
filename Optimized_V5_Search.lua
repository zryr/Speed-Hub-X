local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")

local Custom = {} do
    Custom.ColorRGB = Color3.fromRGB(250, 7, 7)

    function Custom:Create(Name, Properties, Parent)
        local _instance = Instance.new(Name)

        for i, v in pairs(Properties) do
            _instance[i] = v
        end

        if Parent then
            _instance.Parent = Parent
        end

        return _instance
    end

    function Custom:EnabledAFK()
        Player.Idled:Connect(function()
            VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            task.wait(1)
            VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        end)
    end
end

Custom:EnabledAFK()

local Speed_Library = {}

function Speed_Library:CreateWindow(Config)
    local Title = Config[1] or Config.Title or ""
    local Description = Config[2] or Config.Description or ""
    local TabWidth = Config[3] or Config["Tab Width"] or 120
    local SizeUi = Config[4] or Config.SizeUi or UDim2.fromOffset(550, 315)

    local Funcs = {}
    local SpeedHubXGui = Custom:Create("ScreenGui", {
        Name = "SpeedHubXGui",
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    }, RunService:IsStudio() and Player.PlayerGui or (gethui() or cloneref(game:GetService("CoreGui")) or game:GetService("CoreGui")))

    local DropShadowHolder = Custom:Create("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.new(0, 455, 0, 350),
        ZIndex = 0,
        Name = "DropShadowHolder"
    }, SpeedHubXGui)

    local DropShadow = Custom:Create("ImageLabel", {
        Image = "rbxassetid://6015897843",
        ImageColor3 = Color3.fromRGB(15, 15, 15),
        ImageTransparency = 0.5,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(49, 49, 450, 450),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = SizeUi,
        ZIndex = 0,
        Name = "DropShadow"
    }, DropShadowHolder)

    local Main = Custom:Create("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(15, 15, 15),
        BackgroundTransparency = 0.1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = SizeUi,
        Name = "Main"
    }, DropShadow)

    Custom:Create("UICorner", {}, Main)

    Custom:Create("UIStroke", {
        Color = Color3.fromRGB(50, 50, 50),
        Thickness = 1.6
    }, Main)

    local Top = Custom:Create("Frame", {
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0.999,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 38),
        Name = "Top"
    }, Main)

    local TextLabel = Custom:Create("TextLabel", {
        Font = Enum.Font.GothamBold,
        Text = Title,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 0.999,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.new(1, -100, 1, 0),
        Position = UDim2.new(0, 10, 0, 0)
    }, Top)

    Custom:Create("UICorner", {}, Top)

    local TextLabel1 = Custom:Create("TextLabel", {
        Font = Enum.Font.GothamBold,
        Text = Description,
        TextColor3 = Custom.ColorRGB,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 0.999,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.new(1, -(TextLabel.TextBounds.X + 104), 1, 0),
        Position = UDim2.new(0, TextLabel.TextBounds.X + 15, 0, 0)
    }, Top)

    Custom:Create("UIStroke", {
        Color = Custom.ColorRGB,
        Thickness = 0.4
    }, TextLabel1)

    local Close = Custom:Create("TextButton", {
        Font = Enum.Font.SourceSans,
        Text = "",
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextSize = 14,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 0.999,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.new(1, -8, 0.5, 0),
        Size = UDim2.new(0, 25, 0, 25),
        Name = "Close"
    }, Top)

    local ImageLabel1 = Custom:Create("ImageLabel", {
        Image = "rbxassetid://9886659671",
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 0.999,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.new(0.49, 0, 0.5, 0),
        Size = UDim2.new(1, -8, 1, -8)
    }, Close)

    local Min = Custom:Create("TextButton", {
        Font = Enum.Font.SourceSans,
        Text = "",
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextSize = 14,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 0.999,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.new(1, -42, 0.5, 0),
        Size = UDim2.new(0, 25, 0, 25),
        Name = "Min"
    }, Top)

    Custom:Create("ImageLabel", {
        Image = "rbxassetid://9886659276",
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(1, -8, 1, -8)
    }, Min)

    local LayersTab = Custom:Create("Frame", {
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 0.999,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.new(0, 9, 0, 50),
        Size = UDim2.new(0, TabWidth, 1, -59),
        Name = "LayersTab"
    }, Main)

    Custom:Create("UICorner", {
        CornerRadius = UDim.new(0, 2)
    }, LayersTab)

    Custom:Create("Frame", {
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 0.85,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.new(0.5, 0, 0, 38),
        Size = UDim2.new(1, 0, 0, 1),
        Name = "DecideFrame"
    }, Main)

    local Layers = Custom:Create("Frame", {
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 0.999,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.new(0, TabWidth + 18, 0, 50),
        Size = UDim2.new(1, -(TabWidth + 9 + 18), 1, -59),
        Name = "Layers"
    }, Main)

    Custom:Create("UICorner", {
        CornerRadius = UDim.new(0, 2)
    }, Layers)

    local NameTab = Custom:Create("TextLabel", {
        Font = Enum.Font.GothamBold,
        Text = "",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 24,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 0.999,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 30),
        Name = "NameTab"
    }, Layers)

    local LayersReal = Custom:Create("Frame", {
        AnchorPoint = Vector2.new(0, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 0.999,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Position = UDim2.new(0, 0, 1, 0),
        Size = UDim2.new(1, 0, 1, -33),
        Name = "LayersReal"
    }, Layers)

    local LayersFolder = Custom:Create("Folder", {
        Name = "LayersFolder"
    }, LayersReal)

    local LayersPageLayout = Custom:Create("UIPageLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder,
        Name = "LayersPageLayout",
        TweenTime = 0.5,
        EasingDirection = Enum.EasingDirection.InOut,
        EasingStyle = Enum.EasingStyle.Quad
    }, LayersFolder)

    local ScrollTab = Custom:Create("ScrollingFrame", {
        CanvasSize = UDim2.new(0, 0, 2.1, 0),
        ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
        ScrollBarThickness = 0,
        Active = true,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 0.999,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 1, -10),
        Name = "ScrollTab"
    }, LayersTab)

    local UIListLayout = Custom:Create("UIListLayout", {
        Padding = UDim.new(0, 0),
        SortOrder = Enum.SortOrder.LayoutOrder
    }, ScrollTab)

    local Tabs, CountTab, CountDropdown = {}, 0, 0
    function Tabs:CreateTab(Config)
        local _Name = Config[1] or Config.Name or "" 
        local Icon = Config[2] or Config.Icon or ""
        
        local ScrolLayers = Custom:Create("ScrollingFrame", {
            ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
            ScrollBarThickness = 0,
            Active = true,
            LayoutOrder = CountTab,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 0.999,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 1, 0),
            Name = "ScrolLayers",
            Parent = LayersFolder
        })

        Custom:Create("UIListLayout", {
            Padding = UDim.new(0, 3),
            SortOrder = Enum.SortOrder.LayoutOrder,
            Parent = ScrolLayers
        })

        local Tab = Custom:Create("Frame", {
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = CountTab == 0 and 0.92 or 0.999,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            LayoutOrder = CountTab,
            Size = UDim2.new(1, 0, 0, 30),
            Name = "Tab",
            Parent = ScrollTab
        })

        Custom:Create("UICorner", {
            CornerRadius = UDim.new(0, 4),
            Parent = Tab
        })

        local TabButton = Custom:Create("TextButton", {
            Font = Enum.Font.GothamBold,
            Text = "",
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextSize = 13,
            TextXAlignment = Enum.TextXAlignment.Left,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 0.999,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 1, 0),
            Name = "TabButton",
        }, Tab)

        Custom:Create("TextLabel", {
            Font = Enum.Font.GothamBold,
            Text = _Name,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextSize = 13,
            TextXAlignment = Enum.TextXAlignment.Left,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 0.999,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 1, 0),
            Position = UDim2.new(0, 30, 0, 0),
            Name = "TabName",
        }, Tab)

        Custom:Create("ImageLabel", {
            Image = Icon,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 0.999,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            Position = UDim2.new(0, 9, 0, 7),
            Size = UDim2.new(0, 16, 0, 16),
            Name = "FeatureImg",
        }, Tab)

        if CountTab == 0 then
            LayersPageLayout:JumpToIndex(0)
            NameTab.Text = _Name
    
            local ChooseFrame = Custom:Create("Frame", {
                BackgroundColor3 = Custom.ColorRGB,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                Position = UDim2.new(0, 2, 0, 9),
                Size = UDim2.new(0, 1, 0, 12),
                Name = "ChooseFrame",
            }, Tab)
    
            Custom:Create("UIStroke", {
                Color = Custom.ColorRGB,
                Thickness = 1.6,
            }, ChooseFrame)
    
            Custom:Create("UICorner", {}, ChooseFrame)
        end

        TabButton.Activated:Connect(function()
            local FrameChoose = nil

            for _, s in pairs(ScrollTab:GetChildren()) do
                for _, v in pairs(s:GetChildren()) do
                    if v.Name == "ChooseFrame" then
                        FrameChoose = v
                        break
                    end
                end

                if FrameChoose then break end
            end
    
            if FrameChoose and Tab.LayoutOrder ~= LayersPageLayout.CurrentPage.LayoutOrder then
                for _, TabFrame in pairs(ScrollTab:GetChildren()) do
                    if TabFrame.Name == "Tab" then
                        TweenService:Create(TabFrame, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {BackgroundTransparency = 0.999}):Play()
                    end
                end
    
                local _TabT = TweenService:Create(Tab, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {BackgroundTransparency = 0.92})
                local _FTween = TweenService:Create(FrameChoose, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Position = UDim2.new(0, 2, 0, 9 + (33 * Tab.LayoutOrder))})
    
                _TabT:Play()
                _FTween:Play()
    
                LayersPageLayout:JumpToIndex(Tab.LayoutOrder)
    
                task.wait(0.05)
                NameTab.Text = _Name
    
                TweenService:Create(FrameChoose, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 1, 0, 20)}):Play()
    
                task.wait(0.2)
                TweenService:Create(FrameChoose, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 1, 0, 12)}):Play()
            end
        end)

        local Sections, CountSection = {}, 0

        function Sections:AddSection(Title, OpenSection)
            local Title = Title or ""
            local OpenSection = OpenSection or false
    
            local Section = Custom:Create("Frame", {
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 0.999,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                ClipsDescendants = true,
                LayoutOrder = CountSection,
                Size = UDim2.new(1, 0, 0, 30),
                Name = "Section"
            }, ScrolLayers)
    
            local SectionReal = Custom:Create("Frame", {
                AnchorPoint = Vector2.new(0.5, 0),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 0.935,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                LayoutOrder = 1,
                Position = UDim2.new(0.5, 0, 0, 0),
                Size = UDim2.new(1, 1, 0, 30),
                Name = "SectionReal"
            }, Section)
    
            Custom:Create("UICorner", {
                CornerRadius = UDim.new(0, 4)
            }, SectionReal)
    
            local SectionButton = Custom:Create("TextButton", {
                Font = Enum.Font.SourceSans,
                Text = "",
                TextColor3 = Color3.fromRGB(0, 0, 0),
                TextSize = 14,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 0.999,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 1, 0),
                Name = "SectionButton"
            }, SectionReal)
    
            local FeatureFrame = Custom:Create("Frame", {
                AnchorPoint = Vector2.new(1, 0.5),
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                BackgroundTransparency = 0.999,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                Position = UDim2.new(1, -5, 0.5, 0),
                Size = UDim2.new(0, 20, 0, 20),
                Name = "FeatureFrame"
            }, SectionReal)
    
            local FeatureImg = Custom:Create("ImageLabel", {
                Image = "rbxassetid://16851841101",
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 0.999,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                Position = UDim2.new(0.5, 0, 0.5, 0),
                Rotation = -90,
                Size = UDim2.new(1, 6, 1, 6),
                Name = "FeatureImg"
            }, FeatureFrame)
    
            local SectionTitle = Custom:Create("TextLabel", {
                Font = Enum.Font.GothamBold,
                Text = Title,
                TextColor3 = Color3.fromRGB(230, 230, 230),
                TextSize = 13,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top,
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 0.999,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                Position = UDim2.new(0, 10, 0.5, 0),
                Size = UDim2.new(1, -50, 0, 13),
                Name = "SectionTitle"
            }, SectionReal)
    
            local SectionDecideFrame = Custom:Create("Frame", {
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 0),
                Position = UDim2.new(0.5, 0, 0, 33),
                Size = UDim2.new(0, 0, 0, 2),
                Name = "SectionDecideFrame"
            }, Section)
            Custom:Create("UICorner", {}, SectionDecideFrame)
            Custom:Create("UIGradient", {
                Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 20)),
                    ColorSequenceKeypoint.new(0.5, Custom.ColorRGB),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 20))
                }
            }, SectionDecideFrame)
    
            local SectionAdd = Custom:Create("Frame", {
                AnchorPoint = Vector2.new(0.5, 0),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 0.999,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                ClipsDescendants = true,
                LayoutOrder = 1,
                Position = UDim2.new(0.5, 0, 0, 38),
                Size = UDim2.new(1, 0, 0, 100),
                Name = "SectionAdd"
            }, Section)
    
            Custom:Create("UICorner", {
                CornerRadius = UDim.new(0, 2)
            }, SectionAdd)
        
            Custom:Create("UIListLayout", {
                Padding = UDim.new(0, 3),
                SortOrder = Enum.SortOrder.LayoutOrder
            }, SectionAdd)
    
            local function UpdateSizeScroll()
                local OffsetY = 0
    
                for _, child in pairs(ScrolLayers:GetChildren()) do
                    if child.Name ~= "UIListLayout" then
                        OffsetY = OffsetY + 3 + child.Size.Y.Offset
                    end
                end
                
                ScrolLayers.CanvasSize = UDim2.new(0, 0, 0, OffsetY)
            end
        
            local function UpdateSizeSection()
                if OpenSection then
                    local SectionSizeYWitdh = 38
    
                    for _, v in pairs(SectionAdd:GetChildren()) do
                        if v.Name ~= "UIListLayout" and v.Name ~= "UICorner" then
                            SectionSizeYWitdh = SectionSizeYWitdh + v.Size.Y.Offset + 3
                        end
                    end
        
                    TweenService:Create(FeatureFrame, TweenInfo.new(0.1), {Rotation = 90}):Play()
                    TweenService:Create(Section, TweenInfo.new(0.1), {Size = UDim2.new(1, 1, 0, SectionSizeYWitdh)}):Play()
                    TweenService:Create(SectionAdd, TweenInfo.new(0.1), {Size = UDim2.new(1, 0, 0, SectionSizeYWitdh - 38)}):Play()
                    TweenService:Create(SectionDecideFrame, TweenInfo.new(0.1), {Size = UDim2.new(1, 0, 0, 2)}):Play()
                        
                    task.wait(0.5)
                    UpdateSizeScroll()
                end
            end
        
            local function ToggleSection()
                if OpenSection then
                    TweenService:Create(FeatureFrame, TweenInfo.new(0.1), {Rotation = 0}):Play()
                    TweenService:Create(Section, TweenInfo.new(0.1), {Size = UDim2.new(1, 1, 0, 30)}):Play()
                    TweenService:Create(SectionDecideFrame, TweenInfo.new(0.1), {Size = UDim2.new(0, 0, 0, 2)}):Play()
        
                    OpenSection = false
                    task.wait(0.1)
                    UpdateSizeScroll()
                else
                    OpenSection = true
                    UpdateSizeSection()
                end
            end
        
            SectionButton.Activated:Connect(ToggleSection)
            SectionAdd.ChildAdded:Connect(UpdateSizeSection)
            SectionAdd.ChildRemoved:Connect(UpdateSizeSection)
        
            UpdateSizeScroll()

            local Item, ItemCount = {}, 0

            function Item:AddDropdown(Config)
                local Title = Config[1] or Config.Title or ""
                local Content = Config[2] or Config.Content or ""
                local Multi = Config[3] or Config.Multi or false
                local Options = Config[4] or Config.Options or {}
                local Default = Config[5] or Config.Default or {}
                local Callback = Config[6] or Config.Callback or function() end

                local Funcs_Dropdown = {Value = Default, Options = Options}

                local Dropdown = Custom:Create("Frame", {
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 0.935,
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    BorderSizePixel = 0,
                    LayoutOrder = ItemCount,
                    Size = UDim2.new(1, 0, 0, 35),
                    Name = "Dropdown"
                }, SectionAdd)

                local DropdownButton = Custom:Create("TextButton", {
                    Font = Enum.Font.SourceSans,
                    Text = "",
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    TextSize = 14,
                    BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                    BackgroundTransparency = 0.999,
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 1, 0),
                    Name = "ToggleButton"
                }, Dropdown)

                Custom:Create("UICorner", {
                    CornerRadius = UDim.new(0, 4)
                }, Dropdown)

                local DropdownTitle = Custom:Create("TextLabel", {
                    Font = Enum.Font.GothamBold,
                    Text = Title,
                    TextColor3 = Color3.fromRGB(230, 230, 230),
                    TextSize = 13,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Top,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 0.999,
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    BorderSizePixel = 0,
                    Position = UDim2.new(0, 10, 0, 10),
                    Size = UDim2.new(1, -180, 0, 13),
                    Name = "DropdownTitle",
                    Parent = Dropdown
                })

                local DropdownContent = Custom:Create("TextLabel", {
                    Font = Enum.Font.GothamBold,
                    Text = Content,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextSize = 12,
                    TextTransparency = 0.6,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Bottom,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 0.999,
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    BorderSizePixel = 0,
                    Position = UDim2.new(0, 10, 0, 23),
                    Size = UDim2.new(1, -180, 0, 12),
                    Name = "DropdownContent",
                    Parent = Dropdown
                })
                
                DropdownContent.Size = UDim2.new(1, -180, 0, 12 + (12 * (DropdownContent.TextBounds.X // DropdownContent.AbsoluteSize.X)))
                DropdownContent.TextWrapped = true
                Dropdown.Size = UDim2.new(1, 0, 0, DropdownContent.AbsoluteSize.Y + 33)
                
                DropdownContent:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
                    DropdownContent.TextWrapped = false
                        
                    DropdownContent.Size = UDim2.new(1, -180, 0, 12 + (12 * (DropdownContent.TextBounds.X // DropdownContent.AbsoluteSize.X)))
                    Dropdown.Size = UDim2.new(1, 0, 0, DropdownContent.AbsoluteSize.Y + 33)
                        
                    DropdownContent.TextWrapped = true

                    UpdateSizeSection()
                end)

                local SelectOptionsFrame = Custom:Create("Frame", {
                    AnchorPoint = Vector2.new(1, 0.5),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 0.95,
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    BorderSizePixel = 0,
                    Position = UDim2.new(1, -7, 0.5, 0),
                    Size = UDim2.new(0, 148, 0, 30),
                    Name = "SelectOptionsFrame",
                    LayoutOrder = CountDropdown
                }, Dropdown)

                Custom:Create("UICorner", {
                    CornerRadius = UDim.new(0, 4)
                }, SelectOptionsFrame)

                DropdownButton.Activated:Connect(function()
                    local tweenInfo = TweenInfo.new(0.1)
                    local DropdownTween = TweenService:Create(SelectOptionsFrame, tweenInfo, {Position = UDim2.new(1, -11, 0.5, 0)})
                    DropdownTween:Play()
                end)

                local OptionSelecting = Custom:Create("TextLabel", {
                    Font = Enum.Font.GothamBold,
                    Text = "",
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextSize = 12,
                    TextTransparency = 0.6,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    AnchorPoint = Vector2.new(0, 0.5),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 0.999,
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    BorderSizePixel = 0,
                    Position = UDim2.new(0, 5, 0.5, 0),
                    Size = UDim2.new(1, -30, 1, -8),
                    Name = "OptionSelecting",
                }, SelectOptionsFrame)

                local OptionImg = Custom:Create("ImageLabel", {
                    Image = "rbxassetid://16851841101",
                    ImageColor3 = Color3.fromRGB(231, 231, 231),
                    AnchorPoint = Vector2.new(1, 0.5),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 0.999,
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    BorderSizePixel = 0,
                    Position = UDim2.new(1, 0, 0.5, 0),
                    Size = UDim2.new(0, 25, 0, 25),
                    Name = "OptionImg",
                }, SelectOptionsFrame)

                local ScrollSelect = Custom:Create("ScrollingFrame", {
                    CanvasSize = UDim2.new(0, 0, 0, 0),
                    ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
                    ScrollBarThickness = 0,
                    Active = true,
                    LayoutOrder = CountDropdown,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 0.999,
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 1, 0),
                    Name = "ScrollSelect",
                }, SelectOptionsFrame)

                Custom:Create("UIListLayout", {
                    Padding = UDim.new(0, 3),
                    SortOrder = Enum.SortOrder.LayoutOrder,
                }, ScrollSelect)

                local DropCount = 0

                function Funcs_Dropdown:Clear()
                    for _, DropFrame in pairs(ScrollSelect:GetChildren()) do
                        if DropFrame.Name == "Option" then
                            Funcs_Dropdown.Value = {}
                            Funcs_Dropdown.Options = {}
                            OptionSelecting.Text = "Select Options"
                            DropFrame:Destroy()
                        end
                                   end
                
                function Funcs_Dropdown:Set(Value)
                    Funcs_Dropdown.Value = Value or Funcs_Dropdown.Value

                    for _, Drop in pairs(ScrollSelect:GetChildren()) do
                        if Drop.Name ~= "UIListLayout" then
                            local isTextFound = table.find(Funcs_Dropdown.Value, Drop.OptionText.Text)
                            local tweenInfoInOut = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

                            local Size = isTextFound and UDim2.new(0, 1, 0, 12) or UDim2.new(0, 0, 0, 0)
                            local BackgroundTransparency = isTextFound and 0.935 or 0.999
                            local Transparency = isTextFound and 0 or 0.999
                        
                            TweenService:Create(Drop.ChooseFrame, tweenInfoInOut, {Size = Size}):Play()
                            TweenService:Create(Drop.ChooseFrame.UIStroke, tweenInfoInOut, {Transparency = Transparency}):Play()
                            TweenService:Create(Drop, tweenInfoInOut, {BackgroundTransparency = BackgroundTransparency}):Play()
                        end
                    end
                
                    local DropdownValueTable = table.concat(Funcs_Dropdown.Value, ", ")
                    OptionSelecting.Text = DropdownValueTable ~= "" and DropdownValueTable or "Select Options"
                    Callback(Funcs_Dropdown.Value)
                end

                function Funcs_Dropdown:AddOption(OptionName)
                    OptionName = OptionName or "Option"
        
                    local Option = Custom:Create("Frame", {
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 0.999,
                        BorderColor3 = Color3.fromRGB(0, 0, 0),
                        BorderSizePixel = 0,
                        LayoutOrder = DropCount,
                        Size = UDim2.new(1, 0, 0, 30),
                        Name = "Option"
                    }, ScrollSelect)
        
                    Custom:Create("UICorner", {
                        CornerRadius = UDim.new(0, 3)
                    }, Option)
        
                    local OptionButton = Custom:Create("TextButton", {
                        Font = Enum.Font.GothamBold,
                        Text = "",
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextSize = 13,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 0.999,
                        BorderColor3 = Color3.fromRGB(0, 0, 0),
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 1, 0),
                        Name = "OptionButton"
                    }, Option)
        
                    Custom:Create("TextLabel", {
                        Font = Enum.Font.GothamBold,
                        Text = OptionName,
                        TextSize = 13,
                        TextColor3 = Color3.fromRGB(230, 230, 230),
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Top,
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 0.999,
                        BorderColor3 = Color3.fromRGB(0, 0, 0),
                        BorderSizePixel = 0,
                        Position = UDim2.new(0, 8, 0, 8),
                        Size = UDim2.new(1, -100, 0, 13),
                        Name = "OptionText"
                    }, Option)
        
                    local ChooseFrame = Custom:Create("Frame", {
                        AnchorPoint = Vector2.new(0, 0.5),
                        BackgroundColor3 = Custom.ColorRGB,
                        BorderColor3 = Color3.fromRGB(0, 0, 0),
                        BorderSizePixel = 0,
                        Position = UDim2.new(0, 2, 0.5, 0),
                        Size = UDim2.new(0, 0, 0, 0),
                        Name = "ChooseFrame"
                    }, Option)
        
                    Custom:Create("UIStroke", {
                        Color = Custom.ColorRGB,
                        Thickness = 1.6,
                        Transparency = 0.999
                    }, ChooseFrame)
        
                    Custom:Create("UICorner", {}, ChooseFrame)
        
                    OptionButton.Activated:Connect(function()
                        local isOptionSelected = Option.BackgroundTransparency > 0.95

                        if Multi then
                            if isOptionSelected then
                                if not table.find(Funcs_Dropdown.Value, OptionName) then
                                    table.insert(Funcs_Dropdown.Value, OptionName)
                                end
                            else
                                for i, value in ipairs(Funcs_Dropdown.Value) do
                                    if value == OptionName then
                                        table.remove(Funcs_Dropdown.Value, i)
                                        break
                                    end
                                end
                            end
                        else
                            Funcs_Dropdown.Value = {OptionName}
                        end

                        Funcs_Dropdown:Set(Funcs_Dropdown.Value)
                    end)
                
                    local function UpdateCanvasSize()
                        local OffsetY = 0

                        for _, child in ipairs(ScrollSelect:GetChildren()) do
                            if child.Name ~= "UIListLayout" then
                                OffsetY = OffsetY + 3 + child.Size.Y.Offset
                            end
                        end

                        ScrollSelect.CanvasSize = UDim2.new(0, 0, 0, OffsetY)
                    end
                
                    UpdateCanvasSize()

                    DropCount += 1
                end

                function Funcs_Dropdown:Refresh(RefreshList, Selecting)
                    RefreshList = RefreshList or {}
                    Selecting = Selecting or {}
                    
                    Funcs_Dropdown:Clear()
                    
                    for _, Drop in ipairs(RefreshList) do
                        Funcs_Dropdown:AddOption(Drop)
                    end
            
                    Funcs_Dropdown.Options = RefreshList
                    Funcs_Dropdown:Set(Selecting)
                end

                local SearchBar = Custom:Create("TextBox", {
                    Font = Enum.Font.GothamBold,
                    PlaceholderText = "Search",
                    PlaceholderColor3 = Color3.fromRGB(120, 120, 120),
                    Text = "",
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextSize = 12,
                    BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                    BackgroundTransparency = 0.9,
                    BorderColor3 = Color3.fromRGB(255, 0, 0),
                    BorderSizePixel = 1,
                    Size = UDim2.new(1, 0, 0, 20),
                    Parent = ScrollSelect
                })

                SearchBar:GetPropertyChangedSignal("Text"):Connect(function()
                    local searchText = SearchBar.Text:lower()
                    for _, optionFrame in pairs(ScrollSelect:GetChildren()) do
                        if optionFrame:IsA("Frame") and optionFrame.Name == "Option" then
                            local optionText = optionFrame.OptionText.Text:lower()
                            optionFrame.Visible = optionText:find(searchText) ~= nil
                        end
                    end
                end)

                Funcs_Dropdown:Refresh(Funcs_Dropdown.Options, Funcs_Dropdown.Value)
            
                ItemCount += 1
                CountDropdown += 1
                return Funcs_Dropdown
            end

            ItemCount += 1
            return Item
        end

        CountTab += 1
        return Sections
    end

    return Tabs
end

return Speed_Library
