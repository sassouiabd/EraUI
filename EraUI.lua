local EraUI_Frame = CreateFrame("Frame");

--********************************
--            Bars
--********************************
-- Hide ShortCuts
-- local function HideAllHotKeys()
	-- for i = 1, 12 do _G["BonusActionButton"..i.."HotKey"]:SetAlpha(0) end
	-- for i = 1, 12 do _G["MultiBarBottomLeftButton"..i.."HotKey"]:SetAlpha(0) end
	-- for i = 1, 12 do _G["MultiBarBottomRightButton"..i.."HotKey"]:SetAlpha(0) end
	-- for i = 1, 12 do _G["ActionButton"..i.."HotKey"]:SetAlpha(0) end
	-- for i = 1, 12 do _G["MultiBarLeftButton"..i.."HotKey"]:SetAlpha(0) end
	-- for i = 1, 12 do _G["MultiBarRightButton"..i.."HotKey"]:SetAlpha(0) end
-- end

local function HideUseless()

	-- MainBarArt
	MainMenuBarArtFrameBackground:Hide();
	MainMenuBarArtFrame.LeftEndCap:Hide();
	MainMenuBarArtFrame.RightEndCap:Hide();
	
	-- Page Number
	MainMenuBarArtFrame.PageNumber:Hide();
	
	-- Page Up, Down button
	ActionBarDownButton:Hide();
	ActionBarUpButton:Hide();

	-- HonorBar
	StatusTrackingBarManager:UnregisterAllEvents();
	StatusTrackingBarManager:Hide();
	StatusTrackingBarManager.Show=StatusTrackingBarManager.Hide;

	--error UI
	UIErrorsFrame:Hide();
	
end

local function MoveBars()
	--Action bars
	ActionButton1:ClearAllPoints()
	ActionButton1:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 550, 40);
	ActionButton1.SetPoint = function() end;
	
	MultiBarBottomRightButton1:ClearAllPoints()
	MultiBarBottomRightButton1:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 0, -50);
	MultiBarBottomRightButton1.SetPoint = function() end;
	
	--Stance bar
	StanceButton1:ClearAllPoints();
	StanceButton1:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 450, 40);
	StanceButton1.SetPoint = function() end;

end


--********************************
--            PLAYER
--********************************

hooksecurefunc("UnitFramePortrait_Update",function(self)
        if self.portrait then
                if UnitIsPlayer(self.unit) then                         
                        local t = CLASS_ICON_TCOORDS[select(2, UnitClass(self.unit))]
                        if t then
                                self.portrait:SetTexture("Interface\\TargetingFrame\\UI-Classes-Circles")
                                self.portrait:SetTexCoord(unpack(t))
                        end
                else
                        self.portrait:SetTexCoord(0,1,0,1)
                end
        end
end)

local function ModifyPlayerProps() 
	BuffFrame:ClearAllPoints();
	BuffFrame:SetPoint("CENTER",PlayerFrame,"CENTER",950,100);
	BuffFrame.SetPoint = function() end;
	
	PlayerFrame:SetScale(1.2);
	PlayerFrame:ClearAllPoints();
	PlayerFrame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT",45, 500);
	PlayerFrame.SetPoint = function() end;
	
	PlayerPrestigeBadge:SetAlpha(0);
	PlayerPrestigePortrait:SetAlpha(0);
	
	
	
	-- Cast Bar Timers
	CastingBarFrame.timer = CastingBarFrame:CreateFontString(nil);
	CastingBarFrame.timer:SetFont(STANDARD_TEXT_FONT,12,"OUTLINE");
	CastingBarFrame.timer:SetPoint("BOTTOMRIGHT", CastingBarFrame, "BOTTOMRIGHT", 0, 0);
	CastingBarFrame.update = .1;
	 
	CastingBarFrame:HookScript("OnUpdate",function(self,elapsed)
			if not self.timer then return end
			if self.update and self.update < elapsed then
					if self.casting then
							self.timer:SetText(format("%.1f", max(self.maxValue - self.value, 0)))
					elseif self.channeling then
							self.timer:SetText(format("%.1f", max(self.value, 0)))
					else
							self.timer:SetText("")
					end
					self.update = .1
			else
					self.update = self.update - elapsed
			end
	end)
	
	-- Cast Bar Posi
	CastingBarFrame:ClearAllPoints()
	CastingBarFrame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 430, 90);
	CastingBarFrame.SetPoint = function() end
	CastingBarFrame:SetScale(1.5)


end

local function EliteFrame()
	local t="Interface\\TargetingFrame\\UI-TargetingFrame-rare"
	PlayerFrameTexture:SetTexture(t)
	hooksecurefunc("TargetFrame_Update",
	function(f)
		if UnitIsPlayer(f.unit)
			then _G[f:GetName().."TextureFrameTexture"]:SetTexture(t)
		end 
	end)
end

--********************************
--            Target
--********************************

local function ModifyTargetProps()

	TargetFrame:SetScale(1.2);
	TargetFrame:ClearAllPoints();
	TargetFrame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT",270, 500);
	TargetFrame.SetPoint = function() end;
	

	
	TargetFrameTextureFramePrestigeBadge:SetAlpha(0);
	TargetFrameTextureFramePrestigePortrait:SetAlpha(0);
	
	
		-- Cast Bar Timers
	TargetFrameSpellBar.timer = TargetFrameSpellBar:CreateFontString(nil);
	TargetFrameSpellBar.timer:SetFont(STANDARD_TEXT_FONT,12,"OUTLINE");
	TargetFrameSpellBar.timer:SetPoint("BOTTOMRIGHT", TargetFrameSpellBar, "BOTTOMRIGHT", 0, 0);
	TargetFrameSpellBar.update = .1;
	 
	TargetFrameSpellBar:HookScript("OnUpdate",function(self,elapsed)
			if not self.timer then return end
			if self.update and self.update < elapsed then
					if self.casting then
							self.timer:SetText(format("%.1f", max(self.maxValue - self.value, 0)))
					elseif self.channeling then
							self.timer:SetText(format("%.1f", max(self.value, 0)))
					else
							self.timer:SetText("")
					end
					self.update = .1
			else
					self.update = self.update - elapsed
			end
	end)
	
	
	TargetFrameSpellBar:SetScale(1.88);
	TargetFrameSpellBar:ClearAllPoints();
	TargetFrameSpellBar:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT",100, 315);
	TargetFrameSpellBar.SetPoint = function() end;

end

--********************************
--            Focus
--********************************

local function ModifyFocusProps()

	FocusFrame:SetScale(1.2);
	FocusFrame:ClearAllPoints();
	FocusFrame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT",270, 150);
	FocusFrame.SetPoint = function() end;
		
	FocusFrameTextureFramePrestigeBadge:SetAlpha(0);
	FocusFrameTextureFramePrestigePortrait:SetAlpha(0);
	
	FocusFrameSpellBar.timer = FocusFrameSpellBar:CreateFontString(nil);
	FocusFrameSpellBar.timer:SetFont(STANDARD_TEXT_FONT,12,"OUTLINE");
	FocusFrameSpellBar.timer:SetPoint("BOTTOMRIGHT", FocusFrameSpellBar, "BOTTOMRIGHT", 0, 0);
	FocusFrameSpellBar.update = .1;
	FocusFrameSpellBar:HookScript("OnUpdate",function(self,elapsed)
		if not self.timer then return end
		if self.update and self.update < elapsed then
				if self.casting then
						self.timer:SetText(format("%.1f", max(self.maxValue - self.value, 0)))
				elseif self.channeling then
						self.timer:SetText(format("%.1f", max(self.value, 0)))
				else
						self.timer:SetText("")
				end
				self.update = .1
		else
				self.update = self.update - elapsed
		end
	end)
	
	FocusFrameSpellBar:SetScale(1.88)
	FocusFrameSpellBar:ClearAllPoints();
	FocusFrameSpellBar:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT",100, 130);
	FocusFrameSpellBar.SetPoint = function() end;
end

--********************************
--            MiniMap
--********************************
local function ModifyMiniMap()

	-- Minimap Tweaks
	--Dont change anything here
	MinimapZoomIn:Hide()
	MinimapZoomOut:Hide()
	Minimap:EnableMouseWheel(true)
	Minimap:SetScript('OnMouseWheel', function(self, delta)
			if delta > 0 then
					Minimap_ZoomIn()
			else
					Minimap_ZoomOut()
			end
	end)
	MiniMapTracking:ClearAllPoints()
	MiniMapTracking:SetPoint("TOPRIGHT", -26, 7)
	MiniMapTracking.SetPoint = function() end;

end


--********************************
--            QuestTracker
--********************************
local QT = ObjectiveTrackerFrame
QT.ClearAllPoints = function() end
QT:SetPoint("TOPRIGHT", MinimapCluster, "BOTTOM", 45, -5) 
QT.SetPoint = function() end
QT:SetMovable(true)
QT:SetUserPlaced(true)
QT:SetClampedToScreen(true)
QT:SetHeight(550)
QT:SetWidth(190)

local MoveQuestTracker = CreateFrame("Frame", nil, QT)  
MoveQuestTracker:SetHeight(15)
MoveQuestTracker:ClearAllPoints()
MoveQuestTracker:SetPoint("TOPLEFT", QT)
MoveQuestTracker:SetPoint("TOPRIGHT", QT)
MoveQuestTracker:EnableMouse(true)
MoveQuestTracker:SetHitRectInsets(-5, -5, -5, -5)
MoveQuestTracker:RegisterForDrag("LeftButton")
MoveQuestTracker:SetScript("OnDragStart", function(self, button)
	if button=="LeftButton" and IsModifiedClick()then
		QT:StartMoving()
	end
end)
MoveQuestTracker:SetScript("OnDragStop", function(self, button)
	QT:StopMovingOrSizing()
end)

--********************************
--            Main
--********************************
function EraUI_Update()

	ModifyPlayerProps();

	ModifyTargetProps();

	ModifyFocusProps();

	HideUseless();
	
	MoveBars();
	
	EliteFrame();
	
	ModifyMiniMap();

end


function EraUI_Frame_EventHandler(self, event)
  if (event == "PLAYER_ENTERING_WORLD") then
    EraUI_Update()
  end
end

EraUI_Frame:SetScript("OnEvent", EraUI_Frame_EventHandler)
EraUI_Frame:RegisterEvent("PLAYER_ENTERING_WORLD")

