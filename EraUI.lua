local EraUI_Frame = CreateFrame("Frame");

--********************************
--            Bars
--********************************
local function HideAllHotKeys()

local names = {
   "BonusActionButton",
   "MultiBarBottomLeftButton",
   "MultiBarBottomRightButton",
   "ActionButton",
   "MultiBarLeftButton",
   "MultiBarRightButton"
}

for _, name in pairs(names) do
   for i=1, 12 do
      local HotKey = _G[name..i] and _G[name..i].HotKey
      if HotKey then
            HotKey:SetAlpha(0)
      end
   end
end
end

local function HideUslessUI()

	-- MainBarArt
	-- MainMenuBarArtFrameBackground:Hide();
	-- MainMenuBarArtFrame.LeftEndCap:Hide();
	-- MainMenuBarArtFrame.RightEndCap:Hide();
	
	-- Page Number
	-- MainMenuBarArtFrame.PageNumber:Hide();
	
	-- Page Up, Down button
	-- ActionBarDownButton:Hide();
	-- ActionBarUpButton:Hide();

	-- HonorBar
	-- StatusTrackingBarManager:UnregisterAllEvents();
	-- StatusTrackingBarManager:Hide();
	-- StatusTrackingBarManager.Show=StatusTrackingBarManager.Hide;

	--error UI
	--UIErrorsFrame:Hide();
  
  --Binds
  HideAllHotKeys();
	
end

local function UpdateBars()
	--Action bars
  MainMenuBarArtFrame:SetScale(1.5);
  
	MicroButtonAndBagsBar:ClearAllPoints();
	MicroButtonAndBagsBar:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -50, 0);
	MicroButtonAndBagsBar.SetPoint = function() end;
  
  MainMenuBarBackpackButton:ClearAllPoints()
	MainMenuBarBackpackButton:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 55);
  MainMenuBarBackpackButton.SetPoint = function() end

  MicroButtonAndBagsBar.MicroBagBar:Hide(1)


  MicroButtonAndBagsBar:SetScale(0.8);
  CharacterMicroButton:SetScale(0.8);
  SpellbookMicroButton:SetScale(0.8);
  TalentMicroButton:SetScale(0.8);
  AchievementMicroButton:SetScale(0.8);
  QuestLogMicroButton:SetScale(0.8);
  GuildMicroButton:SetScale(0.8);
  LFDMicroButton:SetScale(0.8);
  CollectionsMicroButton:SetScale(0.8);
  EJMicroButton:SetScale(0.8);
  StoreMicroButton:SetScale(0.8);
  MainMenuMicroButton:SetScale(0.8);
  

	ActionButton1:ClearAllPoints()
	ActionButton1:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 287, 0);
	ActionButton1.SetPoint = function() end;
  
  MultiBarBottomLeft:ClearAllPoints()
	MultiBarBottomLeft:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 287, 42);
	MultiBarBottomLeft.SetPoint = function() end;
  

  MultiBarBottomRight:ClearAllPoints()
  UIPARENT_MANAGED_FRAME_POSITIONS["MultiBarBottomRight"] = nil
  MultiBarBottomRightButton1:ClearAllPoints()
  MultiBarBottomRightButton1:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 0, -50);
  MultiBarBottomRightButton1.SetPoint = function() end;
  MultiBarBottomRight:SetScale(0.5)
  MultiBarBottomRight:Show()

	
	--Stance bar
	StanceButton1:ClearAllPoints();
	StanceButton1:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 540, 150);
	StanceButton1.SetPoint = function() end;
  StanceBarFrame:SetScale(0.8);
  

end


--********************************
--            PLAYER
--********************************

-- hooksecurefunc("UnitFramePortrait_Update",function(self)
        -- if self.portrait then
                -- if UnitIsPlayer(self.unit) then                         
                        -- local t = CLASS_ICON_TCOORDS[select(2, UnitClass(self.unit))]
                        -- if t then
                                -- self.portrait:SetTexture("Interface\\TargetingFrame\\UI-Classes-Circles")
                                -- self.portrait:SetTexCoord(unpack(t))
                        -- end
                -- else
                        -- self.portrait:SetTexCoord(0,1,0,1)
                -- end
        -- end
-- end)

local function UpdatePlayer() 
	BuffFrame:ClearAllPoints();
	BuffFrame:SetPoint("CENTER",PlayerFrame,"CENTER",1150,150);
	BuffFrame.SetPoint = function() end;
	
	PlayerFrame:SetScale(1.2);
	PlayerFrame:ClearAllPoints();
	PlayerFrame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT",5, 500);
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
  
  -- disable hit indicator
  --PlayerFrame:UnregisterEvent('UNIT_COMBAT');
  PlayerStatusTexture:Hide();
  PlayerRestIcon:Hide();
  PlayerAttackIcon:Hide();
  PlayerRestGlow:Hide();
  --PlayerLevelText:Hide()
  PlayerAttackGlow:Hide();
  PlayerStatusGlow:Hide();


end



local function ToggleEliteFrame()
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
--            Textures
-- TODO addit in function
--********************************

-- local frame=CreateFrame("Frame")
-- frame:RegisterEvent("ADDON_LOADED")

-- frame:SetScript("OnEvent", function(self, event, addon)
		-- if (addon == "Blizzard_TimeManager") then
				-- for i, v in pairs({PlayerFrameTexture, TargetFrameTextureFrameTexture, PetFrameTexture, PartyMemberFrame1Texture, PartyMemberFrame2Texture, PartyMemberFrame3Texture, PartyMemberFrame4Texture,
						-- PartyMemberFrame1PetFrameTexture, PartyMemberFrame2PetFrameTexture, PartyMemberFrame3PetFrameTexture, PartyMemberFrame4PetFrameTexture, FocusFrameTextureFrameTexture,
						-- TargetFrameToTTextureFrameTexture, FocusFrameToTTextureFrameTexture, BonusActionBarFrameTexture0, BonusActionBarFrameTexture1, BonusActionBarFrameTexture2, BonusActionBarFrameTexture3,
						-- BonusActionBarFrameTexture4, MainMenuBarTexture0, MainMenuBarTexture1, MainMenuBarTexture2, MainMenuBarTexture3, MainMenuMaxLevelBar0, MainMenuMaxLevelBar1, MainMenuMaxLevelBar2,
						-- MainMenuMaxLevelBar3, MinimapBorder, CastingBarFrameBorder, FocusFrameSpellBarBorder, TargetFrameSpellBarBorder, MiniMapTrackingButtonBorder, MiniMapLFGFrameBorder, MiniMapBattlefieldBorder,
						-- MiniMapMailBorder, MinimapBorderTop,
						-- select(1, TimeManagerClockButton:GetRegions())
				-- }) do
						-- v:SetVertexColor(.4, .4, .4)
				-- end

				-- for i,v in pairs({ select(2, TimeManagerClockButton:GetRegions()) }) do
						-- v:SetVertexColor(1, 1, 1)
				-- end

				-- self:UnregisterEvent("ADDON_LOADED")
				-- frame:SetScript("OnEvent", nil)
		-- end
-- end)

-- for i, v in pairs({ MainMenuBarLeftEndCap, MainMenuBarRightEndCap }) do
		-- v:SetVertexColor(.35, .35, .35)
-- end

--********************************
--            Target
--********************************

local function UpdateTarget()

	TargetFrame:SetScale(1.2);
	TargetFrame:ClearAllPoints();
	TargetFrame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT",230, 500);
	TargetFrame.SetPoint = function() end;
	
	--Combo point on target
	SetCVar("comboPointLocation",1)

	-- Remove pvp icon
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
	TargetFrameSpellBar:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT",70, 315);
	TargetFrameSpellBar.SetPoint = function() end;

end

--********************************
--            GameToolTip
--********************************

function UpdateGameToolTip()
 GameTooltip:SetScript("OnTooltipSetUnit", function(self)
      self:SetScale(0.8);
      self:ClearAllPoints();
      self:SetPoint("BOTTOMRIGHT", WorldFrame, "BOTTOMRIGHT", -230, 70);
end)

--This should get rid of any random units that are moused over. If the unit is targetted, in your party/raid, or belongs to you, it'll still show.
--GameTooltip:SetScript("OnTooltipSetUnit",function(self) if select(2,self:GetUnit())!="mouseover" then self:Hide(); end end);
--GameTooltip:SetScript("OnTooltipSetUnit",function(self) self:Hide(); end);
end

--********************************
--            Focus
--********************************

local function UpdateFocus()

	FocusFrame:SetScale(1.2);
	FocusFrame:ClearAllPoints();
	FocusFrame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT",230, 150);
	FocusFrame.SetPoint = function() end;
	
	-- -- Remove PVP icon
	-- FocusFrameTextureFramePrestigeBadge:SetAlpha(0);
	-- FocusFrameTextureFramePrestigePortrait:SetAlpha(0);
	
	-- FocusFrameSpellBar.timer = FocusFrameSpellBar:CreateFontString(nil);
	-- FocusFrameSpellBar.timer:SetFont(STANDARD_TEXT_FONT,12,"OUTLINE");
	-- FocusFrameSpellBar.timer:SetPoint("BOTTOMRIGHT", FocusFrameSpellBar, "BOTTOMRIGHT", 0, 0);
	-- FocusFrameSpellBar.update = .1;
	-- FocusFrameSpellBar:HookScript("OnUpdate",function(self,elapsed)
		-- if not self.timer then return end
		-- if self.update and self.update < elapsed then
				-- if self.casting then
						-- self.timer:SetText(format("%.1f", max(self.maxValue - self.value, 0)))
				-- elseif self.channeling then
						-- self.timer:SetText(format("%.1f", max(self.value, 0)))
				-- else
						-- self.timer:SetText("")
				-- end
				-- self.update = .1
		-- else
				-- self.update = self.update - elapsed
		-- end
	-- end)
	
	-- FocusFrameSpellBar:SetScale(1.88)
	-- FocusFrameSpellBar:ClearAllPoints();
	-- FocusFrameSpellBar:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT",70, 130);
	-- FocusFrameSpellBar.SetPoint = function() end;
end

--********************************
--            MiniMap
--********************************
local function UpdateMinimap()

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
--            AutosSell
--********************************
local function ToggleAutoSellAndRepair()

	-- Autosell grey trash and repair
	--Don't Change anything here
	local g = CreateFrame("Frame")
	g:RegisterEvent("MERCHANT_SHOW")

	g:SetScript("OnEvent", function()  
			local bag, slot
			for bag = 0, 4 do
					for slot = 0, GetContainerNumSlots(bag) do
							local link = GetContainerItemLink(bag, slot)
							if link and (select(3, GetItemInfo(link)) == 0) then
									UseContainerItem(bag, slot)
							end
					end
			end

			if(CanMerchantRepair()) then
					local cost = GetRepairAllCost()
					if cost > 0 then
							local money = GetMoney()
							if IsInGuild() then
									local guildMoney = GetGuildBankWithdrawMoney()
									if guildMoney > GetGuildBankMoney() then
											guildMoney = GetGuildBankMoney()
									end
									if guildMoney > cost and CanGuildBankRepair() then
											RepairAllItems(1)
											print(format("|cfff07100Repair cost covered by G-Bank: %.1fg|r", cost * 0.0001))
											return
									end
							end
							if money > cost then
									RepairAllItems()
									print(format("|cffead000Repair cost: %.1fg|r", cost * 0.0001))
							else
									print("Not enough gold to cover the repair cost.")
							end
					end
			end
	end)
end

--********************************
--            CharchaterMicroButton
--********************************

local function HideMicroButtonsAndBags()

	_HideMicroMenu=not _HideMicroMenu;
  



  if _HideMicroMenu then
     MicroButtonAndBagsBar:Hide();
     CharacterMicroButton:Hide();
     SpellbookMicroButton:Hide();
     TalentMicroButton:Hide();
     AchievementMicroButton:Hide();
     QuestLogMicroButton:Hide();
     GuildMicroButton:Hide();
     LFDMicroButton:Hide();
     CollectionsMicroButton:Hide();
     EJMicroButton:Hide()
    StoreMicroButton:SetScript("OnShow",StoreMicroButton.Hide)
    StoreMicroButton:Hide()
     MainMenuMicroButton:Hide();
  else

    MicroButtonAndBagsBar:Show();
    CharacterMicroButton:Show();
    SpellbookMicroButton:Show();
    TalentMicroButton:Show();
    AchievementMicroButton:Show();
    QuestLogMicroButton:Show();
    GuildMicroButton:Show();
    LFDMicroButton:Show();
    CollectionsMicroButton:Show();
    EJMicroButton:Show();
    StoreMicroButton:SetScript("OnShow",StoreMicroButton.Show)
    StoreMicroButton:Show();
    MainMenuMicroButton:Show();
  end
end

local function UpdateMicroButtonsAndBags()

	--HideMicroButtonsAndBags();
  
	local f = CreateFrame("Button",nil,UIParent)
	f:SetSize(30,30)
	f.t=f:CreateTexture(nil,"BORDER")
	f.t:SetTexture("Interface\\CHATFRAME\\UI-ChatIcon-Minimize-Up.blp")
	f.t:SetAllPoints(f)
  f:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT",0, 180);
	f:Show()

	local ChatHide = false

	f:SetScript("OnClick", HideMicroButtonsAndBags);
	
end

--********************************
--            ChatBox
--********************************

local function HideChatBox()
	_CHATHIDE=not _CHATHIDE 
	for i=1,NUM_CHAT_WINDOWS do 
		for _,v in pairs{"","Tab"}do 
			local f=_G["ChatFrame"..i..v]
			if _CHATHIDE then 
			f.v=f:IsVisible()
			ChatFrameMenuButton:Hide();
			ChatFrameChannelButton:Hide();
			QuickJoinToastButton:Hide();
			--ObjectiveTrackerFrame:Hide();
			end 
			f.ORShow=f.ORShow or f.Show f.Show=_CHATHIDE and f.Hide or f.ORShow 
			if f.v then 
				f:Show();
				ChatFrameMenuButton:Show();
				ChatFrameChannelButton:Show();
				QuickJoinToastButton:Show();
				--ObjectiveTrackerFrame:Show();
			end
		end 
	end
end

local function UpdateChatBox()

	--HideChatBox();
	
	local f = CreateFrame("Button",nil,UIParent)
	f:SetSize(30,30)
	f.t=f:CreateTexture(nil,"BORDER")
	f.t:SetTexture("Interface\\CHATFRAME\\UI-ChatIcon-Minimize-Up.blp")
	f.t:SetAllPoints(f)
	f:SetPoint("BOTTOM","ChatFrame1ButtonFrame","BOTTOM",0,-35)
	f:Show()

	local ChatHide = false

	f:SetScript("OnClick", HideChatBox);
	
end

--********************************
--            QuestTracker
--********************************
-- local QT = ObjectiveTrackerFrame
-- QT.ClearAllPoints = function() end
-- QT:SetPoint("TOPRIGHT", MinimapCluster, "BOTTOM", 45, -5) 
-- QT.SetPoint = function() end
-- QT:SetMovable(true)
-- QT:SetUserPlaced(true)
-- QT:SetClampedToScreen(true)
-- QT:SetHeight(550)
-- QT:SetWidth(190)

-- local MoveQuestTracker = CreateFrame("Frame", nil, QT)  
-- MoveQuestTracker:SetHeight(15)
-- MoveQuestTracker:ClearAllPoints()
-- MoveQuestTracker:SetPoint("TOPLEFT", QT)
-- MoveQuestTracker:SetPoint("TOPRIGHT", QT)
-- MoveQuestTracker:EnableMouse(true)
-- MoveQuestTracker:SetHitRectInsets(-5, -5, -5, -5)
-- MoveQuestTracker:RegisterForDrag("LeftButton")
-- MoveQuestTracker:SetScript("OnDragStart", function(self, button)
	-- if button=="LeftButton" and IsModifiedClick()then
		-- QT:StartMoving()
	-- end
-- end)
-- MoveQuestTracker:SetScript("OnDragStop", function(self, button)
	-- QT:StopMovingOrSizing()
-- end)

--********************************
--            Main
--********************************
function EraUI_Update()

	--UpdatePlayer();

	--UpdateTarget();

	--UpdateFocus();
	
	HideUslessUI();
	
	--UpdateBars();
	
	--ToggleEliteFrame();
	
	--UpdateMinimap();
	
	--ToggleAutoSellAndRepair();
	
	--UpdateChatBox();
  
  --UpdateGameToolTip();
  
  --UpdateMicroButtonsAndBags();
 
  
end


function EraUI_Frame_EventHandler(self, event)
  if (event == "PLAYER_ENTERING_WORLD") then
    EraUI_Update()
  end
end

EraUI_Frame:SetScript("OnEvent", EraUI_Frame_EventHandler)
EraUI_Frame:RegisterEvent("PLAYER_ENTERING_WORLD")

--***********************************************************
-- ADDON COMBAT
--***********************************************************
-- CTT=CreateFrame("Frame")
-- CTT:SetParent(TargetFrame)
-- CTT:SetPoint("Right",TargetFrame,-15)
-- CTT:SetSize(26,26)
-- CTT.t=CTT:CreateTexture(nil,BORDER)
-- CTT.t:SetAllPoints()
-- CTT.t:SetTexture("Interface\\Icons\\ABILITY_DUALWIELD")
-- CTT:Hide()

-- local function FrameOnUpdate(self) if UnitAffectingCombat("target") then self:Show() else self:Hide() end end
-- local g = CreateFrame("Frame")
-- g:SetScript("OnUpdate", function(self) FrameOnUpdate(CTT) end)

-- CFT=CreateFrame("Frame")
-- CFT:SetParent(FocusFrame)
-- CFT:SetPoint("Right",FocusFrame,-15)
-- CFT:SetSize(26,26)
-- CFT.t=CFT:CreateTexture(nil,BORDER)
-- CFT.t:SetAllPoints()
-- CFT.t:SetTexture("Interface\\Icons\\ABILITY_DUALWIELD")
-- CFT:Hide()

-- local function FrameOnUpdate(self) if UnitAffectingCombat("focus") then self:Show() else self:Hide() end end
-- local g = CreateFrame("Frame")
-- g:SetScript("OnUpdate", function(self) FrameOnUpdate(CFT) end)
--***********************************************************