local _G, _ = _G or getfenv()

BINDING_HEADER_WC3HEADER = "Warcraft III - UI"
MAX_LEVEL = 60

local currentCustomFrameNames = {}

local UIFramesTable = {
	"ActionButton_Custom1",
	"ActionButton_Custom2",
	"ActionButton_Custom3",
	"WIIIUI_backgroundMain",
	"WIIIUI_leftpart",
	"Warcaft3_UI_xpFrame",
	"WIIIUI_weaponIcon_1",
	"WIIIUI_weaponIcon_2",
	"WIIIUI_weaponIcon_3",
	"WIIIUI_armorIcon",
	"WIIIUI_actionslotGrid",
	"WIIIUI_rightpart",

	"ActionButton_CustomInventory_1",
	"ActionButton_CustomInventory_2",
	"ActionButton_CustomInventory_3",
	"ActionButton_CustomInventory_4",
	"ActionButton_CustomInventory_5",
	"ActionButton_CustomInventory_6",

	"WIIIUI_texts"
}

local editBoxFramesTable = {
	"ParentOf",
	"ParentPosOf",
	"Point",
	"PosX",
	"PosY",
	"RelativePoint",
	"Width",
	"Height",
	"Transparency",
	"FrameStrata",
	"FrameLevel",
	"Backdrop",
	"Texture",
	"SetDrawLayer",
	"TexCoordLeft",
	"TexCoordRight",
	"TexCoordTop",
	"TexCoordBottom",
	"Hide"
}

function CustomKeyBindings(number)

	if(number == 1)then
		customActionButton1:Click()
	elseif(number == 2)then
		customActionButton2:Click()
	elseif(number == 3)then
		customActionButton3:Click()
	elseif(number == 4)then
		ActionButton_CustomInventory_1:Click()
	elseif(number == 5)then
		ActionButton_CustomInventory_2:Click()
	elseif(number == 6)then
		ActionButton_CustomInventory_3:Click()
	elseif(number == 7)then
		ActionButton_CustomInventory_4:Click()
	elseif(number == 8)then
		ActionButton_CustomInventory_5:Click()
	elseif(number == 9)then
		ActionButton_CustomInventory_6:Click()
	end
end

function SetTheme(selectedTheme)
	wc3UI_Options.theme = selectedTheme
	ChangeTheme()
	AlignUI()
end

function ChangeTheme()
	if(wc3UI_Options.theme == nil)then
		wc3UI_Options.theme = "orc"
	end
	local theme = wc3UI_Options.theme

	Wc3_UI_extensionBackground:SetDrawLayer("BACKGROUND")
	Wc3_UI_right_lid:SetDrawLayer("BORDER", 4)	
	Wc3_UI_bottom_right_top:SetDrawLayer("ARTWORK", 5)

	Wc3_UI_extension1:SetParent("WIIIUI_leftpart")
	Wc3_UI_extension2:SetParent("WIIIUI_leftpart")
	Wc3_UI_extension3:SetParent("WIIIUI_leftpart")

	if(theme == "human")then
		Wc3_UI_right_lid:SetDrawLayer("ARTWORK", 5)	
		Wc3_UI_bottom_right_top:SetDrawLayer("BORDER", 4)	

		Wc3_UI_extension1:SetDrawLayer("OVERLAY")
		Wc3_UI_extension2:SetDrawLayer("ARTWORK")
		Wc3_UI_extension3:SetDrawLayer("BORDER")
		Wc3_UI_right_left:SetDrawLayer("BACKGROUND")
	elseif(theme == "orc")then
		
		Wc3_UI_right_lid:SetDrawLayer("BORDER", 4)	
		Wc3_UI_bottom_right_top:SetDrawLayer("OVERLAY", 5)
		Wc3_UI_right_left:SetDrawLayer("ARTWORK")

		Wc3_UI_extension1:SetDrawLayer("ARTWORK")
		Wc3_UI_extension2:SetDrawLayer("OVERLAY")
		Wc3_UI_extension3:SetDrawLayer("BORDER")

	elseif(theme == "undead")then
		Wc3_UI_right_right_extendedFillerTop_1:SetDrawLayer("OVERLAY")
		Wc3_UI_extension1:SetDrawLayer("OVERLAY")
		Wc3_UI_extension2:SetDrawLayer("ARTWORK")
		Wc3_UI_extension3:SetDrawLayer("BORDER")
	elseif(theme == "nightelf")then
		Wc3_UI_right_right_extendedFillerTop_1:SetDrawLayer("OVERLAY")
		Wc3_UI_right_lid:SetDrawLayer("BORDER", 4)	
		Wc3_UI_bottom_right_top:SetDrawLayer("ARTWORK", 4)	

		Wc3_UI_extension1:SetDrawLayer("OVERLAY")
		Wc3_UI_extension2:SetDrawLayer("ARTWORK")
		Wc3_UI_extension3:SetDrawLayer("BORDER")
		Wc3_UI_extension3:SetDrawLayer("OVERLAY")

		Wc3_UI_extension1:SetParent("WIIIUI_actionslotGrid")
		Wc3_UI_extension2:SetParent("WIIIUI_actionslotGrid")
		Wc3_UI_extension3:SetParent("WIIIUI_actionslotGrid")

		if(wc3UI_Options.hideGride)then

			Wc3_UI_extension1:SetParent("WIIIUI_leftpart")
			Wc3_UI_extension2:SetParent("WIIIUI_leftpart")
			Wc3_UI_extension3:SetParent("WIIIUI_leftpart")

			actionSlotGridMain:Hide()
		else
			actionSlotGridMain:Show()
			Wc3_UI_extension1:SetParent("WIIIUI_actionslotGrid")
			Wc3_UI_extension2:SetParent("WIIIUI_actionslotGrid")
			Wc3_UI_extension3:SetParent("WIIIUI_actionslotGrid")
		end
	end

	-- Left part
	-- Wc3_UI_minimapNoMail		-- Interface\Icons\INV_Letter_15 -- dont change
	Wc3_UI_minimap:SetTexture("Interface\\Addons\\WIIIUI\\art\\"..theme.."\\minimap_portrait\\minimap")
	Wc3_UI_portrait:SetTexture("Interface\\Addons\\WIIIUI\\art\\"..theme.."\\minimap_portrait\\portrait")

	Wc3_UI_extension1:SetTexture("Interface\\Addons\\WIIIUI\\art\\"..theme.."\\actionbar\\ext1")
	Wc3_UI_extension2:SetTexture("Interface\\Addons\\WIIIUI\\art\\"..theme.."\\actionbar\\ext1")
	Wc3_UI_extension3:SetTexture("Interface\\Addons\\WIIIUI\\art\\"..theme.."\\actionbar\\ext2")

	-- Grid
	WIIIUI_actionslotGrid_1:SetTexture("Interface\\Addons\\WIIIUI\\art\\"..theme.."\\actionbar\\actionslots_grid")
	WIIIUI_actionslotGrid_2:SetTexture("Interface\\Addons\\WIIIUI\\art\\"..theme.."\\actionbar\\actionslots_grid")
	WIIIUI_actionslotGrid_3:SetTexture("Interface\\Addons\\WIIIUI\\art\\"..theme.."\\actionbar\\actionslots_grid")
	WIIIUI_actionslotGrid_4:SetTexture("Interface\\Addons\\WIIIUI\\art\\"..theme.."\\actionbar\\actionslots_grid")

	-- Right part
	Wc3_UI_right_middle:SetTexture("Interface\\Addons\\WIIIUI\\art\\"..theme.."\\inventory\\inventory")
	Wc3_UI_right_left:SetTexture("Interface\\Addons\\WIIIUI\\art\\"..theme.."\\inventory\\no_inventory")

	Wc3_UI_right_lid:SetTexture("Interface\\Addons\\WIIIUI\\art\\"..theme.."\\bottom right\\right_part_lid")

	Wc3_UI_bottom_right_top:SetTexture("Interface\\Addons\\WIIIUI\\art\\"..theme.."\\bottom right\\BottomRight_Top")
	Wc3_UI_bottom_right_middle:SetTexture("Interface\\Addons\\WIIIUI\\art\\"..theme.."\\bottom right\\BottomRight_Middle")
	Wc3_UI_bottom_right_bottom:SetTexture("Interface\\Addons\\WIIIUI\\art\\"..theme.."\\bottom right\\BottomRight_Bottom")

	Wc3_UI_right_right_extendedFillerTop_1:SetTexture("Interface\\Addons\\WIIIUI\\art\\"..theme.."\\bottom right\\BottomRightFillerTop")
	Wc3_UI_right_right_extendedFillerTop_2:SetTexture("Interface\\Addons\\WIIIUI\\art\\"..theme.."\\bottom right\\BottomRightFillerTop")
	Wc3_UI_right_right_extendedFillerTop_3:SetTexture("Interface\\Addons\\WIIIUI\\art\\"..theme.."\\bottom right\\BottomRightFillerTop")
	
	Wc3_UI_right_right_extendedFillerBottom_1:SetTexture("Interface\\Addons\\WIIIUI\\art\\"..theme.."\\bottom right\\BottomRightFillerBottom")
	Wc3_UI_right_right_extendedFillerBottom_2:SetTexture("Interface\\Addons\\WIIIUI\\art\\"..theme.."\\bottom right\\BottomRightFillerBottom")
	Wc3_UI_right_right_extendedFillerBottom_3:SetTexture("Interface\\Addons\\WIIIUI\\art\\"..theme.."\\bottom right\\BottomRightFillerBottom")

end

function HideAllFramesEvent()
	WIIIUI_menu:SetScript("OnHide", function()
	
		GeneralTab_Clicked()
		WIIIUI_generalTab:Hide()
		WIIIUI_customizeTab:Hide()
		WIIIUI_customizedMainFrame:Hide()
	end)
end

-- Aligns our menu tabs
function AlignTabs()
	WIIIUI_generalTab:SetPoint("TOPLEFT", WIIIUI_menu, "TOPLEFT", 0, 28)
	WIIIUI_generalTab:SetFrameLevel(500)

	WIIIUI_customizeTab:SetPoint("TOPLEFT", WIIIUI_menu, "TOPLEFT", 90, 28)
	WIIIUI_customizeTab:SetFrameLevel(0)
end

-- Create Customized parent frame
function InitiateParentFrame()
	WIIIUI_customizedMainFrame:Hide()
	WIIIUI_customizedMainFrame:SetPoint("TOPLEFT", WIIIUI_menu, "TOPLEFT", 10, -10)
end

function GeneralTab_Clicked()

	WIIIUI_menu:SetWidth(650)
	WIIIUI_menu:SetHeight(600)
	WIIIUI_menuButtonApply:ClearAllPoints()
	WIIIUI_menuButtonApply:SetPoint("BOTTOMRIGHT", WIIIUI_menu, "BOTTOMRIGHT", -20, 21)

	WIIIUI_generalTab:SetFrameLevel(500)
	WIIIUI_customizeTab:SetFrameLevel(0)
	WIIIUI_customizedMainFrame:Hide()

	-- Show frames from General tab
	local children = { WIIIUI_menu:GetChildren() }
	for i, child in ipairs(children) do
		child:Show()
	end

	local children = { WIIIUI_menu:GetRegions() }
	for i, child in ipairs(children) do
		
		if(not child:GetName())then
			break
		end
		child:Show()
	end

	if(wc3UI_Options.EnableCustomize)then
		HideThemeButtons()
		WIIIUI_menuEnableCustomizeDisabledText:Show()
	else
		WIIIUI_menuEnableCustomizeDisabledText:Hide()
	end
end

function CustomizeTab_Clicked()

	if(not wc3UI_Options.EnableCustomize)then
		ChatFrame1:AddMessage("|cffff0000WIIIUI WARNING - PLEASE CHECK THE \"Enable customize settings\" OPTION TO ACCESS THIS TAB.")
		GeneralTab_Clicked()
		return
	end

	WIIIUI_menu:SetWidth(680)
	WIIIUI_menu:SetHeight(690)
	WIIIUI_menuButtonApply:ClearAllPoints()
	WIIIUI_menuButtonApply:SetPoint("TOPRIGHT", WIIIUI_menu, "TOPRIGHT", -20, -10)

	WIIIUI_generalTab:SetFrameLevel(0)
	WIIIUI_customizeTab:SetFrameLevel(500)

	WIIIUI_customizedMainFrame:Show()
	-- Hide frames from General tab
	local children = { WIIIUI_menu:GetChildren() }
	for i, child in ipairs(children) do
		if string.find(child:GetName(), "CloseButton") or string.find(child:GetName(), "ButtonApply") then
			child:Show()
		else
			child:Hide()
		end
	end

	local children = { WIIIUI_menu:GetRegions() }
	for i, child in ipairs(children) do
		
		if(not child:GetName())then
			break
		end
		child:Hide()
	end
	CreateCustomizedFrames()
end

function CustomizationInfo()

	local headingColor = "|cffFFFF00" -- yellow
	local descriptionColor = "|cffffffff" -- White

	local text = "Description:"
	.."\n\n"..headingColor.."Parent of: "..descriptionColor.."The frames parent, if parent becomes hidden then this becomes hidden as well. "
	.."\n\n"..headingColor.."Parent Position of: "..descriptionColor.."What frame the frame's position is based of."
	.."\n\n"..headingColor.."Hide: "..descriptionColor.."Check to hide frame, uncheck to show frame"
	.."\n\n"..headingColor.."Point: "..descriptionColor.."Anchor point. Point of the object to adjust based on the anchor.\nOptions: TOPLEFT, TOP, TOPRIGHT, LEFT, CENTER, RIGHT, BOTTOMLEFT, BOTTOM, BOTTOMRIGHT"
	.."\n\n"..headingColor.."Pos X: "..descriptionColor.."Move frame based on parent position in horizontal line.\nExample: -5 or 20"
	.."\n\n"..headingColor.."Pos Y: "..descriptionColor.."Move frame based on parent position in vertical line.\nExample: -5 or 20"
	.."\n\n"..headingColor.."Relative to: "..descriptionColor.."Point of the relativeFrame to attach point of frame to.\nOptions: TOPLEFT, TOP, TOPRIGHT, LEFT, CENTER, RIGHT, BOTTOMLEFT, BOTTOM, BOTTOMRIGHT"
	.."\n\n"..headingColor.."Width: "..descriptionColor.."Width, decimals can also be used"
	.."\n\n"..headingColor.."Height: "..descriptionColor.."Height, decimals can also be used"
	.."\n\n"..headingColor.."Transparency: "..descriptionColor.."From 0-1 where 0 is 100% transparency.\nExample: 0.53"
	.."\n\n"..headingColor.."Frame strata: "..descriptionColor.."In what strata the frame is stacked.\nOptions in order low to high: BACKGROUND, LOW, MEDIUM, HIGH, DIALOG, FULLSCREEN, FULLSCREEN_DIALOG, TOOLTIP"
	.."\n\n"..headingColor.."Frame level: "..descriptionColor.."Where the frame is stacked within the frame strata. Value 0 to 10000"
	.."\n\n"..headingColor.."Backdrop: "..descriptionColor.."What backdrop image to use based on filepath.\nExample: Interface\\Addons\\WIIIUI\\art\\other\\golden_frame"
	.."\n\n"..headingColor.."Texture path: "..descriptionColor.."What image to use for the texture frame based on filepath.\nExample: Interface\\Addons\\WIIIUI\\art\\other\\black_background"
	.."\n\n"..headingColor.."Draw layer: "..descriptionColor.."What draw layer the image will be displayed in the current parent frame's frame strata and frame level.\nOptions: BACKGROUND, BORDER, ARTWORK, OVERLAY, HIGHLIGHT"
	.."\n\n"..headingColor.."Tex coords: "..descriptionColor.."What part of the texture that should be shown. Value 0-1.\nExample: left: 0, right: 0.5, top: 0, bottom: 1, will show left half of the image"

	WIIIUI_CustomizeInfoText:SetText(text)
	WIIIUI_CustomizeInfoText:SetPoint("BOTTOMLEFT", WIIIUI_CustomizeInfo, "BOTTOMLEFT", 20, 0)
	WIIIUI_CustomizeInfoText:SetJustifyV("TOP");
	WIIIUI_CustomizeInfoText:SetJustifyH("LEFT");
end

function CreateCustomizedFrames()

	local type
	local point, relativeTo, relativePoint, xOfs, yOfs, relativeName
	local widht, height, transparency
	local strata, frameLevel
	local backdrop, texture, draw
	local texLeft, texRight, texTop, texBottom
	local heightRow = 0
	local moveX = -5
	local UIObjectsTable = {}

	function CreateOptionFrames(count)
		
		function CreateEditBoxFrames(name, number)

			currentCustomFrameNames[number] = name

			-- Parent of
			if(not _G["EditBox_"..number.."_ParentOf"])then
				currentEditBox = CreateFrame("EditBox", "EditBox_"..number.."_ParentOf", WIIIUI_customizedMainFrame, "InputBoxTemplate")
				currentEditBox.title = currentEditBox:CreateFontString("", "OVERLAY");
				currentEditBox.text = currentEditBox:CreateFontString("", "OVERLAY");

				currentEditBox:SetScript("OnEnterPressed", function()
					UpdateCustomThemeSettings()
					ApplyCustomThemeOptions()
				end)
			else
				currentEditBox = _G["EditBox_"..number.."_ParentOf"]
			end
			currentEditBox:SetHeight(40)
			currentEditBox:SetWidth(250)
			currentEditBox:SetPoint("TOPLEFT", 28 + moveX, -30 + (-heightRow) )
			currentEditBox:SetScript("OnEscapePressed", function()
				this:ClearFocus()
				WIIIUI_menu:Hide()
			end)
			currentEditBox:SetText(wc3UI_Options.edit_theme_settings[wc3UI_Options.theme][name]['ParentOf'])

			-- Frame name we are editing
			currentEditBox.title:SetFont("Fonts\\FRIZQT__.TTF", 12, "")
			currentEditBox.title:SetPoint("TOPLEFT", -3 + moveX, 18)	
			currentEditBox.title:SetText("|c00FFFF00"..name)

			currentEditBox.text:SetFont("Fonts\\FRIZQT__.TTF", 12, "")
			currentEditBox.text:SetPoint("TOPLEFT", -3 + moveX, 4)
			currentEditBox.text:SetText("Parent of")

			currentEditBox:Show()
			currentEditBox.title:Show()
			currentEditBox.text:Show()

			if(true)then
				-- Parent pos of
				if(not _G["EditBox_"..number.."_ParentPosOf"])then
					currentEditBox = CreateFrame("EditBox", "EditBox_"..number.."_ParentPosOf", WIIIUI_customizedMainFrame, "InputBoxTemplate")
					currentEditBox.text = currentEditBox:CreateFontString("", "OVERLAY");
					currentEditBox:SetScript("OnEnterPressed", function()
						UpdateCustomThemeSettings()
						ApplyCustomThemeOptions()
					end)
				else
					currentEditBox = _G["EditBox_"..number.."_ParentPosOf"]
				end
				currentEditBox:SetHeight(40)
				currentEditBox:SetWidth(250)
				currentEditBox:SetPoint("TOPLEFT", 298 + moveX, -30 + (-heightRow) )
				currentEditBox:SetScript("OnEscapePressed", function()
					this:ClearFocus()
					WIIIUI_menu:Hide()
				end)
				currentEditBox.text:SetFont("Fonts\\FRIZQT__.TTF", 12, "")
				currentEditBox.text:SetPoint("TOPLEFT", -3 + moveX, 4)
				currentEditBox.text:SetText("Parent Position of")

				currentEditBox:Show()
				currentEditBox.text:Show()

				currentEditBox:SetText(wc3UI_Options.edit_theme_settings[wc3UI_Options.theme][name]['ParentPosOf'])
				
			end

			-- Hide
			if(not _G["EditBox_"..number.."_Hide"])then
				currentEditBox = CreateFrame("CheckButton", "EditBox_"..number.."_Hide", WIIIUI_customizedMainFrame, "OptionsCheckButtonTemplate")
				_G["EditBox_"..number.."_HideText"]:SetText("Hide")
				currentEditBox:SetScript("OnMouseUp", function()

					currentEditBox:SetScript("OnUpdate", function()

						currentEditBox:SetScript("OnUpdate", nil)
						UpdateCustomThemeSettings()
						ApplyCustomThemeOptions()

					end)
				end)
			else
				currentEditBox = _G["EditBox_"..number.."_Hide"]
			end

			if(wc3UI_Options.edit_theme_settings[wc3UI_Options.theme][name]['Hide'])then
				currentEditBox:SetChecked(true)
			else
				currentEditBox:SetChecked(false)
			end
			currentEditBox:SetPoint("TOPLEFT", 560 + moveX, -34 + (-heightRow) )
			currentEditBox:Show()

			-- Relative to (Point)
			if(not _G["EditBox_"..number.."_Point"])then
				currentEditBox = CreateFrame("EditBox", "EditBox_"..number.."_Point", WIIIUI_customizedMainFrame, "InputBoxTemplate")
				currentEditBox.text = currentEditBox:CreateFontString("", "OVERLAY");
				currentEditBox:SetScript("OnEnterPressed", function()
					UpdateCustomThemeSettings()
					ApplyCustomThemeOptions()
				end)
			else
				currentEditBox = _G["EditBox_"..number.."_Point"]
			end
			currentEditBox:SetHeight(40)
			currentEditBox:SetWidth(110)
			currentEditBox:SetPoint("TOPLEFT", 28 + moveX, -70 + (-heightRow) )
			currentEditBox:SetScript("OnEscapePressed", function()
				this:ClearFocus()
				WIIIUI_menu:Hide()
			end)
			currentEditBox.text:SetFont("Fonts\\FRIZQT__.TTF", 12, "")
			currentEditBox.text:SetPoint("TOPLEFT", -3 + moveX, 4)
			currentEditBox.text:SetText("Point")
			currentEditBox:SetText(wc3UI_Options.edit_theme_settings[wc3UI_Options.theme][name]['Point'])

			currentEditBox:Show()
			currentEditBox.text:Show()

			-- Pos X
			if(not _G["EditBox_"..number.."_PosX"])then
				currentEditBox = CreateFrame("EditBox", "EditBox_"..number.."_PosX", WIIIUI_customizedMainFrame, "InputBoxTemplate")
				currentEditBox.text = currentEditBox:CreateFontString("", "OVERLAY");
				currentEditBox:SetScript("OnEnterPressed", function()
					UpdateCustomThemeSettings()
					ApplyCustomThemeOptions()
				end)
			else
				currentEditBox = _G["EditBox_"..number.."_PosX"]
			end
			currentEditBox:SetHeight(40)
			currentEditBox:SetWidth(55)
			currentEditBox:SetPoint("TOPLEFT", 150 + moveX, -70 + (-heightRow) )
			currentEditBox:SetScript("OnEscapePressed", function()
				this:ClearFocus()
				WIIIUI_menu:Hide()
			end)
			currentEditBox.text:SetFont("Fonts\\FRIZQT__.TTF", 12, "")
			currentEditBox.text:SetPoint("TOPLEFT", -3 + moveX, 4)
			currentEditBox.text:SetText("Pos X")
			xOfs = wc3UI_Options.edit_theme_settings[wc3UI_Options.theme][name]['PosX']
			if(xOfs)then
				xOfs = string.format("%.1f", xOfs)	
				currentEditBox:SetText(xOfs)
			end
			currentEditBox:Show()
			currentEditBox.text:Show()

			-- Pos Y
			if(not _G["EditBox_"..number.."_PosY"])then
				currentEditBox = CreateFrame("EditBox", "EditBox_"..number.."_PosY", WIIIUI_customizedMainFrame, "InputBoxTemplate")
				currentEditBox.text = currentEditBox:CreateFontString("", "OVERLAY");
				currentEditBox:SetScript("OnEnterPressed", function()
					UpdateCustomThemeSettings()
					ApplyCustomThemeOptions()
				end)
			else
				currentEditBox = _G["EditBox_"..number.."_PosY"]
			end
			currentEditBox:SetHeight(40)
			currentEditBox:SetWidth(55)
			currentEditBox:SetPoint("TOPLEFT", 220 + moveX, -70 + (-heightRow) )
			currentEditBox:SetScript("OnEscapePressed", function()
				this:ClearFocus()
				WIIIUI_menu:Hide()
			end)
			currentEditBox.text:SetFont("Fonts\\FRIZQT__.TTF", 12, "")
			currentEditBox.text:SetPoint("TOPLEFT", -3 + moveX, 4)
			currentEditBox.text:SetText("Pos Y")
			yOfs = wc3UI_Options.edit_theme_settings[wc3UI_Options.theme][name]['PosY']
			if(yOfs)then
				yOfs = string.format("%.1f", yOfs)	
				currentEditBox:SetText(yOfs)
			end
			currentEditBox:Show()
			currentEditBox.text:Show()

			-- Relative point
			if(not _G["EditBox_"..number.."_RelativePoint"])then
				currentEditBox = CreateFrame("EditBox", "EditBox_"..number.."_RelativePoint", WIIIUI_customizedMainFrame, "InputBoxTemplate")
				currentEditBox.text = currentEditBox:CreateFontString("", "OVERLAY");
				currentEditBox:SetScript("OnEnterPressed", function()
					UpdateCustomThemeSettings()
					ApplyCustomThemeOptions()
				end)
			else
				currentEditBox = _G["EditBox_"..number.."_RelativePoint"]
			end
			currentEditBox:SetHeight(40)
			currentEditBox:SetWidth(110)
			currentEditBox:SetPoint("TOPLEFT", 298 + moveX, -70 + (-heightRow) )
			currentEditBox:SetScript("OnEscapePressed", function()
				this:ClearFocus()
				WIIIUI_menu:Hide()
			end)
			currentEditBox.text:SetFont("Fonts\\FRIZQT__.TTF", 12, "")
			currentEditBox.text:SetPoint("TOPLEFT", -3 + moveX, 4)
			currentEditBox.text:SetText("Relative to")
			currentEditBox:SetText(wc3UI_Options.edit_theme_settings[wc3UI_Options.theme][name]['RelativePoint'])

			currentEditBox:Show()
			currentEditBox.text:Show()

			-- Width
			if(not _G["EditBox_"..number.."_Width"])then
				currentEditBox = CreateFrame("EditBox", "EditBox_"..number.."_Width", WIIIUI_customizedMainFrame, "InputBoxTemplate")
				currentEditBox.text = currentEditBox:CreateFontString("", "OVERLAY");
				currentEditBox:SetScript("OnEnterPressed", function()
					UpdateCustomThemeSettings()
					ApplyCustomThemeOptions()
				end)
			else
				currentEditBox = _G["EditBox_"..number.."_Width"]
			end
			currentEditBox:SetHeight(40)
			currentEditBox:SetWidth(55)
			currentEditBox:SetPoint("TOPLEFT", 28 + moveX, -110 + (-heightRow) )
			currentEditBox:SetScript("OnEscapePressed", function()
				this:ClearFocus()
				WIIIUI_menu:Hide()
			end)
			currentEditBox.text:SetFont("Fonts\\FRIZQT__.TTF", 12, "")
			currentEditBox.text:SetPoint("TOPLEFT", -3 + moveX, 4)
			currentEditBox.text:SetText("Width")
			width = wc3UI_Options.edit_theme_settings[wc3UI_Options.theme][name]['Width']
			if(width)then
				width = string.format("%.1f", width)	
				currentEditBox:SetText(width)
			end
			currentEditBox:Show()
			currentEditBox.text:Show()

			-- Height
			if(not _G["EditBox_"..number.."_Height"])then
				currentEditBox = CreateFrame("EditBox", "EditBox_"..number.."_Height", WIIIUI_customizedMainFrame, "InputBoxTemplate")
				currentEditBox.text = currentEditBox:CreateFontString("", "OVERLAY");
				currentEditBox:SetScript("OnEnterPressed", function()
					UpdateCustomThemeSettings()
					ApplyCustomThemeOptions()
				end)
			else
				currentEditBox = _G["EditBox_"..number.."_Height"]
			end
			currentEditBox:SetHeight(40)
			currentEditBox:SetWidth(55)
			currentEditBox:SetPoint("TOPLEFT", 106 + moveX, -110 + (-heightRow) )
			currentEditBox:SetScript("OnEscapePressed", function()
				this:ClearFocus()
				WIIIUI_menu:Hide()
			end)
			currentEditBox.text:SetFont("Fonts\\FRIZQT__.TTF", 12, "")
			currentEditBox.text:SetPoint("TOPLEFT", -3 + moveX, 4)
			currentEditBox.text:SetText("Height")
			height = wc3UI_Options.edit_theme_settings[wc3UI_Options.theme][name]['Height']
			if(height)then
				height = string.format("%.1f", height)	
				currentEditBox:SetText(height)
			end
			currentEditBox:Show()
			currentEditBox.text:Show()

			-- Transparency
			if(not _G["EditBox_"..number.."_Transparency"])then
				currentEditBox = CreateFrame("EditBox", "EditBox_"..number.."_Transparency", WIIIUI_customizedMainFrame, "InputBoxTemplate")
				currentEditBox.text = currentEditBox:CreateFontString("", "OVERLAY");
				currentEditBox:SetScript("OnEnterPressed", function()
					UpdateCustomThemeSettings()
					ApplyCustomThemeOptions()
				end)
			else
				currentEditBox = _G["EditBox_"..number.."_Transparency"]
			end
			currentEditBox:SetHeight(40)
			currentEditBox:SetWidth(80)
			currentEditBox:SetPoint("TOPLEFT", 184 + moveX, -110 + (-heightRow) )
			currentEditBox:SetScript("OnEscapePressed", function()
				this:ClearFocus()
				WIIIUI_menu:Hide()
			end)
			currentEditBox.text:SetFont("Fonts\\FRIZQT__.TTF", 12, "")
			currentEditBox.text:SetPoint("TOPLEFT", -3 + moveX, 4)
			currentEditBox.text:SetText("Transparency")
			currentEditBox:SetText(wc3UI_Options.edit_theme_settings[wc3UI_Options.theme][name]['Transparency'])

			currentEditBox:Show()
			currentEditBox.text:Show()

			type = _G[name]:GetObjectType()

			if(type)then

				-- Frame
				if(_G["EditBox_"..number.."_FrameStrata"])then
					_G["EditBox_"..number.."_FrameStrata"]:Hide()
				end
				if(_G["EditBox_"..number.."_FrameLevel"])then
					_G["EditBox_"..number.."_FrameLevel"]:Hide()
				end
				if(_G["EditBox_"..number.."_Backdrop"])then
					_G["EditBox_"..number.."_Backdrop"]:Hide()
				end

				-- Texture
				if(_G["EditBox_"..number.."_Texture"])then
					_G["EditBox_"..number.."_Texture"]:Hide()
				end
				if(_G["EditBox_"..number.."_SetDrawLayer"])then
					_G["EditBox_"..number.."_SetDrawLayer"]:Hide()
				end
				if(_G["EditBox_"..number.."_TexCoordLeft"])then
					_G["EditBox_"..number.."_TexCoordLeft"]:Hide()
				end
				if(_G["EditBox_"..number.."_TexCoordRight"])then
					_G["EditBox_"..number.."_TexCoordRight"]:Hide()
				end
				if(_G["EditBox_"..number.."_TexCoordTop"])then
					_G["EditBox_"..number.."_TexCoordTop"]:Hide()
				end
				if(_G["EditBox_"..number.."_TexCoordBottom"])then
					_G["EditBox_"..number.."_TexCoordBottom"]:Hide()
				end
				
				if(type == "Frame" or type == "Minimap")then
					
					-- Frame Strata
					if(not _G["EditBox_"..number.."_FrameStrata"])then
						currentEditBox = CreateFrame("EditBox", "EditBox_"..number.."_FrameStrata", WIIIUI_customizedMainFrame, "InputBoxTemplate")
						currentEditBox.text = currentEditBox:CreateFontString("", "OVERLAY");
						currentEditBox:SetScript("OnEnterPressed", function()
							UpdateCustomThemeSettings()
							ApplyCustomThemeOptions()
						end)
					else
						currentEditBox = _G["EditBox_"..number.."_FrameStrata"]
					end
					currentEditBox:SetHeight(40)
					currentEditBox:SetWidth(150)
					currentEditBox:SetPoint("TOPLEFT", 300 + moveX, -110 + (-heightRow) )
					currentEditBox:SetScript("OnEscapePressed", function()
						this:ClearFocus()
						WIIIUI_menu:Hide()
					end)
					currentEditBox.text:SetFont("Fonts\\FRIZQT__.TTF", 12, "")
					currentEditBox.text:SetPoint("TOPLEFT", -3 + moveX, 4)
					currentEditBox.text:SetText("Frame strata")
					currentEditBox:SetText(wc3UI_Options.edit_theme_settings[wc3UI_Options.theme][name]['FrameStrata'])

					currentEditBox:Show()
					currentEditBox.text:Show()

					-- Frame level
					if(not _G["EditBox_"..number.."_FrameLevel"])then
						currentEditBox = CreateFrame("EditBox", "EditBox_"..number.."_FrameLevel", WIIIUI_customizedMainFrame, "InputBoxTemplate")
						currentEditBox.text = currentEditBox:CreateFontString("", "OVERLAY");
						currentEditBox:SetScript("OnEnterPressed", function()
							UpdateCustomThemeSettings()
							ApplyCustomThemeOptions()
						end)
					else
						currentEditBox = _G["EditBox_"..number.."_FrameLevel"]
					end
					currentEditBox:SetHeight(40)
					currentEditBox:SetWidth(80)
					currentEditBox:SetPoint("TOPLEFT", 460 + moveX, -110 + (-heightRow) )
					currentEditBox:SetScript("OnEscapePressed", function()
						this:ClearFocus()
						WIIIUI_menu:Hide()
					end)
					currentEditBox.text:SetFont("Fonts\\FRIZQT__.TTF", 12, "")
					currentEditBox.text:SetPoint("TOPLEFT", -3 + moveX, 4)
					currentEditBox.text:SetText("Frame level")
					currentEditBox:SetText(wc3UI_Options.edit_theme_settings[wc3UI_Options.theme][name]['FrameLevel'])

					currentEditBox:Show()
					currentEditBox.text:Show()

					-- Backdrop
					if(not _G["EditBox_"..number.."_Backdrop"])then
						currentEditBox = CreateFrame("EditBox", "EditBox_"..number.."_Backdrop", WIIIUI_customizedMainFrame, "InputBoxTemplate")
						currentEditBox.text = currentEditBox:CreateFontString("", "OVERLAY");
						currentEditBox:SetScript("OnEnterPressed", function()
							UpdateCustomThemeSettings()
							ApplyCustomThemeOptions()
						end)
					else
						currentEditBox = _G["EditBox_"..number.."_Backdrop"]
					end
					currentEditBox:SetHeight(40)
					currentEditBox:SetWidth(500)
					currentEditBox:SetPoint("TOPLEFT", 28 + moveX, -150 + (-heightRow) )
					currentEditBox:SetScript("OnEscapePressed", function()
						this:ClearFocus()
						WIIIUI_menu:Hide()
					end)
					currentEditBox.text:SetFont("Fonts\\FRIZQT__.TTF", 12, "")
					currentEditBox.text:SetPoint("TOPLEFT", -3 + moveX, 4)
					currentEditBox.text:SetText("Backdrop")
					backdrop = nil
					if(wc3UI_Options.edit_theme_settings[wc3UI_Options.theme][name]['Backdrop'])then
						backdrop = wc3UI_Options.edit_theme_settings[wc3UI_Options.theme][name]['Backdrop']['bgFile']
					end
					if(backdrop)then
						currentEditBox:SetText(backdrop)
					end


					currentEditBox:Show()
					currentEditBox.text:Show()
					
				elseif(type == "Texture")then

					-- Texture
					if(not _G["EditBox_"..number.."_Texture"])then
						currentEditBox = CreateFrame("EditBox", "EditBox_"..number.."_Texture", WIIIUI_customizedMainFrame, "InputBoxTemplate")
						currentEditBox.text = currentEditBox:CreateFontString("", "OVERLAY");
						currentEditBox:SetScript("OnEnterPressed", function()
							UpdateCustomThemeSettings()
							ApplyCustomThemeOptions()
						end)
					else
						currentEditBox = _G["EditBox_"..number.."_Texture"]
					end
					currentEditBox:SetHeight(40)
					currentEditBox:SetWidth(500)
					currentEditBox:SetPoint("TOPLEFT", 28 + moveX, -150 + (-heightRow) )
					currentEditBox:SetScript("OnEscapePressed", function()
						this:ClearFocus()
						WIIIUI_menu:Hide()
					end)
					currentEditBox.text:SetFont("Fonts\\FRIZQT__.TTF", 12, "")
					currentEditBox.text:SetPoint("TOPLEFT", -3 + moveX, 4)
					currentEditBox.text:SetText("Texture path")
					texture = wc3UI_Options.edit_theme_settings[wc3UI_Options.theme][name]['Texture']
					if(texture) then
						currentEditBox:SetText(wc3UI_Options.edit_theme_settings[wc3UI_Options.theme][name]['Texture'])
					end

					currentEditBox:Show()
					currentEditBox.text:Show()

					-- SetDrawLayer
					if(not _G["EditBox_"..number.."_SetDrawLayer"])then
						currentEditBox = CreateFrame("EditBox", "EditBox_"..number.."_SetDrawLayer", WIIIUI_customizedMainFrame, "InputBoxTemplate")
						currentEditBox.text = currentEditBox:CreateFontString("", "OVERLAY");
						currentEditBox:SetScript("OnEnterPressed", function()
							UpdateCustomThemeSettings()
							ApplyCustomThemeOptions()
						end)
					else
						currentEditBox = _G["EditBox_"..number.."_SetDrawLayer"]
					end
					currentEditBox:SetHeight(40)
					currentEditBox:SetWidth(100)
					currentEditBox:SetPoint("TOPLEFT", 28 + moveX, -190 + (-heightRow) )
					currentEditBox:SetScript("OnEscapePressed", function()
						this:ClearFocus()
						WIIIUI_menu:Hide()
					end)
					currentEditBox.text:SetFont("Fonts\\FRIZQT__.TTF", 12, "")
					currentEditBox.text:SetPoint("TOPLEFT", -3 + moveX, 4)
					currentEditBox.text:SetText("Draw layer")
					currentEditBox:SetText(wc3UI_Options.edit_theme_settings[wc3UI_Options.theme][name]['SetDrawLayer'])

					currentEditBox:Show()
					currentEditBox.text:Show()

					-- TexCoord left
					if(not _G["EditBox_"..number.."_TexCoordLeft"])then
						currentEditBox = CreateFrame("EditBox", "EditBox_"..number.."_TexCoordLeft", WIIIUI_customizedMainFrame, "InputBoxTemplate")
						currentEditBox.text = currentEditBox:CreateFontString("", "OVERLAY");
						currentEditBox:SetScript("OnEnterPressed", function()
							UpdateCustomThemeSettings()
							ApplyCustomThemeOptions()
						end)
					else
						currentEditBox = _G["EditBox_"..number.."_TexCoordLeft"]
					end
					currentEditBox:SetHeight(40)
					currentEditBox:SetWidth(123)
					currentEditBox:SetPoint("TOPLEFT", 136 + moveX, -190 + (-heightRow) )
					currentEditBox:SetScript("OnEscapePressed", function()
						this:ClearFocus()
						WIIIUI_menu:Hide()
					end)
					currentEditBox.text:SetFont("Fonts\\FRIZQT__.TTF", 12, "")
					currentEditBox.text:SetPoint("TOPLEFT", -3 + moveX, 4)
					currentEditBox.text:SetText("Tex coord left")
					texLeft = wc3UI_Options.edit_theme_settings[wc3UI_Options.theme][name]['TexCoordLeft']
					if(texLeft)then
						texLeft = string.format("%.15f", texLeft)
						currentEditBox:SetText(texLeft)
					end
					currentEditBox:Show()
					currentEditBox.text:Show()

					-- TexCoord right
					if(not _G["EditBox_"..number.."_TexCoordRight"])then
						currentEditBox = CreateFrame("EditBox", "EditBox_"..number.."_TexCoordRight", WIIIUI_customizedMainFrame, "InputBoxTemplate")
						currentEditBox.text = currentEditBox:CreateFontString("", "OVERLAY");
						currentEditBox:SetScript("OnEnterPressed", function()
							UpdateCustomThemeSettings()
							ApplyCustomThemeOptions()
						end)
					else
						currentEditBox = _G["EditBox_"..number.."_TexCoordRight"]
					end
					currentEditBox:SetHeight(40)
					currentEditBox:SetWidth(123)
					currentEditBox:SetPoint("TOPLEFT", 265 + moveX, -190 + (-heightRow) )
					currentEditBox:SetScript("OnEscapePressed", function()
						this:ClearFocus()
						WIIIUI_menu:Hide()
					end)
					currentEditBox.text:SetFont("Fonts\\FRIZQT__.TTF", 12, "")
					currentEditBox.text:SetPoint("TOPLEFT", -3 + moveX, 4)
					currentEditBox.text:SetText("Tex coord right")
					texRight = wc3UI_Options.edit_theme_settings[wc3UI_Options.theme][name]['TexCoordRight']
					if(texRight)then
						texRight = string.format("%.15f", texRight)
						currentEditBox:SetText(texRight)
					end
					currentEditBox:Show()
					currentEditBox.text:Show()

					-- TexCoord top
					if(not _G["EditBox_"..number.."_TexCoordTop"])then
						currentEditBox = CreateFrame("EditBox", "EditBox_"..number.."_TexCoordTop", WIIIUI_customizedMainFrame, "InputBoxTemplate")
						currentEditBox.text = currentEditBox:CreateFontString("", "OVERLAY");
						currentEditBox:SetScript("OnEnterPressed", function()
							UpdateCustomThemeSettings()
							ApplyCustomThemeOptions()
						end)
					else
						currentEditBox = _G["EditBox_"..number.."_TexCoordTop"]
					end
					currentEditBox:SetHeight(40)
					currentEditBox:SetWidth(123)
					currentEditBox:SetPoint("TOPLEFT", 395 + moveX, -190 + (-heightRow) )
					currentEditBox:SetScript("OnEscapePressed", function()
						this:ClearFocus()
						WIIIUI_menu:Hide()
					end)
					currentEditBox.text:SetFont("Fonts\\FRIZQT__.TTF", 12, "")
					currentEditBox.text:SetPoint("TOPLEFT", -3 + moveX, 4)
					currentEditBox.text:SetText("Tex coord top")
					texTop = wc3UI_Options.edit_theme_settings[wc3UI_Options.theme][name]['TexCoordTop']
					if(texTop)then
						texTop = string.format("%.15f", texTop)
						currentEditBox:SetText(texTop)
					end
					currentEditBox:Show()
					currentEditBox.text:Show()

					-- TexCoord bottom
					if(not _G["EditBox_"..number.."_TexCoordBottom"])then
						currentEditBox = CreateFrame("EditBox", "EditBox_"..number.."_TexCoordBottom", WIIIUI_customizedMainFrame, "InputBoxTemplate")
						currentEditBox.text = currentEditBox:CreateFontString("", "OVERLAY");
						currentEditBox:SetScript("OnEnterPressed", function()
							UpdateCustomThemeSettings()
							ApplyCustomThemeOptions()
						end)
					else
						currentEditBox = _G["EditBox_"..number.."_TexCoordBottom"]
					end
					currentEditBox:SetHeight(40)
					currentEditBox:SetWidth(123)
					currentEditBox:SetPoint("TOPLEFT", 525 + moveX, -190 + (-heightRow) )
					currentEditBox:SetScript("OnEscapePressed", function()
						this:ClearFocus()
						WIIIUI_menu:Hide()
					end)
					currentEditBox.text:SetFont("Fonts\\FRIZQT__.TTF", 12, "")
					currentEditBox.text:SetPoint("TOPLEFT", -3 + moveX, 4)
					currentEditBox.text:SetText("Tex coord bottom")
					texBottom = wc3UI_Options.edit_theme_settings[wc3UI_Options.theme][name]['TexCoordBottom']
					if(texBottom)then
						texBottom = string.format("%.15f", texBottom)
						currentEditBox:SetText(texBottom)
					end
					currentEditBox:Show()
					currentEditBox.text:Show()

				end
			end

			if(type)then
				if(type == "Frame" or type == "Minimap")then
					heightRow = heightRow + 178
				elseif(type == "CheckButton")then
					heightRow = heightRow + 138
				elseif(type == "Texture")then
					heightRow = heightRow + 220
				else
					heightRow = heightRow + 138
				end
			end

		end

		count = 0
		for i, frame in ipairs(UIObjectsTable) do

			CreateEditBoxFrames(frame, count)
			count = count + 1
			if(count == 3)then
				break
			end
		end

	end
	
	if(true)then
		
		local count = 0
		-- Count all frames
		for i, frame in ipairs(UIFramesTable) do

			count = count + 1
			table.insert(UIObjectsTable, frame)

			children = { _G[frame]:GetChildren() }
			if(children)then
				for i, child in ipairs(children) do
					if(child:GetName())then

						if( string.find(child:GetName(), "Wc3_UI_weaponIcon_tex_") or string.find(child:GetName(), "Wc3_UI_armorIcon_tex")) then

						else
							count = count + 1
							table.insert(UIObjectsTable, child:GetName())
						end
						
					end
				end
			end

			children = { _G[frame]:GetRegions() }
			if(children)then
				for i, child in ipairs(children) do
					if(child:GetName())then

						if( string.find(child:GetName(), "ActionButton_Custom1Icon") or string.find(child:GetName(), "ActionButton_Custom1NormalTexture")
							or string.find(child:GetName(), "ActionButton_Custom2Icon") or string.find(child:GetName(), "ActionButton_Custom2NormalTexture") 
							or string.find(child:GetName(), "ActionButton_Custom3Icon") or string.find(child:GetName(), "ActionButton_Custom3NormalTexture")
							or string.find(child:GetName(), "ActionButton_CustomInventory_1Icon") or string.find(child:GetName(), "ActionButton_CustomInventory_1NormalTexture") 
							or string.find(child:GetName(), "ActionButton_CustomInventory_2Icon") or string.find(child:GetName(), "ActionButton_CustomInventory_2NormalTexture") 
							or string.find(child:GetName(), "ActionButton_CustomInventory_3Icon") or string.find(child:GetName(), "ActionButton_CustomInventory_3NormalTexture") 
							or string.find(child:GetName(), "ActionButton_CustomInventory_4Icon") or string.find(child:GetName(), "ActionButton_CustomInventory_4NormalTexture") 
							or string.find(child:GetName(), "ActionButton_CustomInventory_5Icon") or string.find(child:GetName(), "ActionButton_CustomInventory_5NormalTexture") 
							or string.find(child:GetName(), "ActionButton_CustomInventory_6Icon") or string.find(child:GetName(), "ActionButton_CustomInventory_6NormalTexture") 
						) then

						else
							count = count + 1
							table.insert(UIObjectsTable, child:GetName())
						end
					end
				end
			end

		end

		count = count + 4
		table.insert(UIObjectsTable, "Minimap")
		table.insert(UIObjectsTable, "MinimapZoneTextButton")
		table.insert(UIObjectsTable, "GameTimeFrame")
		table.insert(UIObjectsTable, "ShapeshiftButton1")

		if( not wc3UI_Options['base_settings'] )then
			wc3UI_Options['base_settings'] = {}
		end

		if(not wc3UI_Options.base_scale)then
			wc3UI_Options.base_scale = wc3UI_Options.uiScale
		end
		
		if( not wc3UI_Options.edit_theme_settings )then
			wc3UI_Options.edit_theme_settings = {}
		end

		if(not WIIIUI_customizedMainFrame.text)then
			WIIIUI_customizedMainFrame.text = WIIIUI_customizedMainFrame:CreateFontString("", "OVERLAY");
			WIIIUI_customizedMainFrame.text:SetFont("Fonts\\FRIZQT__.TTF", 12, "")
			WIIIUI_customizedMainFrame.text:SetPoint("TOPRIGHT", -233, -5)
			WIIIUI_customizedMainFrame.text:SetText("|c00FF9922Click 3 times fast to reset")
		end
		

		-- generate tables with data, one with base values and one for editing
		if( not wc3UI_Options['base_settings'][wc3UI_Options.theme] ) then -- only generate once

			local parentName, relToName, frameStrata, frameLevel, backdrop
			local tempTable = {}
			local newTable = {}
			local data

			for i, frame in ipairs(UIObjectsTable) do
				
				local currentObject = _G[frame]
				local point, relTo, relPoint, xOfs, yOfs = currentObject:GetPoint()
				local isHidden

				if(currentObject:GetParent())then
					parentName = currentObject:GetParent():GetName()
				else
					parentName = ""
				end

				if(currentObject:IsVisible())then
					isHidden = false
				else
					isHidden = true
				end

				data = {
					['name'] = frame,
					['ParentOf'] = parentName,
					['ParentPosOf'] = relTo:GetName(),
					['Point'] = point,
					['PosX'] = xOfs,
					['PosY'] = yOfs,
					['RelativePoint'] = relPoint,
					['Width'] = currentObject:GetWidth(),
					['Height'] = currentObject:GetHeight(),
					['Transparency'] = currentObject:GetAlpha(),
					['Hide'] = isHidden
				}
				
				if(currentObject:GetObjectType() == "Frame" or currentObject:GetObjectType() == "Minimap")then

					data['FrameStrata'] = currentObject:GetFrameStrata()
					data['FrameLevel'] = currentObject:GetFrameLevel()
					data['Backdrop'] = currentObject:GetBackdrop()
					if(not data['Backdrop'] or data['Backdrop'] == "")then
						data['Backdrop'] = {
							['bgFile'] = ""
						}
					end

				elseif(currentObject:GetObjectType() == "Texture")then

					data['Texture'] = currentObject:GetTexture()					
					data['SetDrawLayer'] = currentObject:GetDrawLayer()
										
					local ULx,ULy,LLx,LLy,URx,URy,LRx,LRy = currentObject:GetTexCoord()
					data['TexCoordLeft'] = ULx
					data['TexCoordRight'] = URx
					data['TexCoordTop'] = ULy
					data['TexCoordBottom'] = LRy

				end
				
				table.insert(tempTable, data)
			end

			for i, val in ipairs(tempTable) do
				newTable[val['name']] = val
			end

			wc3UI_Options['base_settings'][tostring(wc3UI_Options.theme)] = newTable
			wc3UI_Options.edit_theme_settings[tostring(wc3UI_Options.theme)] = newTable

			WIIIUI_menu:Hide()
			WIIIUI_ForceReload:Show()
			WIIIUI_ForceReloadButton:SetText("MUST RELOAD TO SET UP THE CUSTOMIZATION FOR CURRENT THEME (ONLY HAPPENS ONCE PER THEME)")
			WIIIUI_ForceReloadButton:SetWidth(700)
		end

		-- Start creating current page and max pages
		WIIIUI_currentPage = 1
		local maxPages = math.ceil(count/3)
		if(not _G['WIIIUI_pagesFrame'])then
			pagesFrame = CreateFrame("Frame", "WIIIUI_pagesFrame", WIIIUI_customizedMainFrame, nil)
			pagesFrame.text = pagesFrame:CreateFontString("", "OVERLAY");
		end
		pagesFrame:SetWidth(60)
		pagesFrame:SetHeight(30)
		pagesFrame:SetPoint("BOTTOM", 0, -30 )
		pagesFrame:SetBackdrop({
			bgFile = "Interface/Tooltips/UI-Tooltip-Background",
		})
		pagesFrame:SetBackdropColor(0, 0, 0, 1)

		pagesFrame.text:SetFont("Fonts\\FRIZQT__.TTF", 12, "")
		pagesFrame.text:SetPoint("CENTER", 0, 0)
		pagesFrame.text:SetText("|c00FF9922"..WIIIUI_currentPage.." / "..maxPages)

		WIIIUI_customizedMainFrame:SetFrameLevel(1)
		WIIIUI_customizedMainFrame:EnableMouseWheel(true)
		WIIIUI_customizedMainFrame:SetScript("OnMouseWheel", function()
			
			if(arg1 == 1)then
				WIIIUI_currentPage = WIIIUI_currentPage + 1
			elseif(arg1 == -1)then
				WIIIUI_currentPage = WIIIUI_currentPage - 1
			end
			
			if(WIIIUI_currentPage > maxPages)then
				WIIIUI_currentPage = maxPages
			elseif(WIIIUI_currentPage < 1)then
				WIIIUI_currentPage = 1	
			end
			pagesFrame.text:SetText("|c00FF9922"..WIIIUI_currentPage.." / "..maxPages)

			-- hide all inputs etc
			local hideTable = {
				"_ParentOf",
				"_ParentPosOf",
				"_Point",
				"_PosX",
				"_PosY",
				"_RelativePoint",
				"_Width",
				"_Height",
				"_Transparency",
				"_FrameStrata",
				"_FrameLevel",
				"_Backdrop",
				"_Texture",
				"_SetDrawLayer",
				"_TexCoordLeft",
				"_TexCoordRight",
				"_TexCoordTop",
				"_TexCoordBottom",
				"_Hide"
			}

			for i, input in ipairs(hideTable) do

				for j=0, 2, 1 do
					if(_G["EditBox_"..j..input])then

						thisInput = _G["EditBox_"..j..input]
						thisInput:Hide()
						if(thisInput:GetObjectType() ~= "CheckButton")then
							thisInput.text:Hide()
							if(thisInput.title)then
								thisInput.title:Hide()
							end
						end
	
					end
				end
			end

			count = 0
			heightRow = 0
			local skipCount = 0
			local skip = (WIIIUI_currentPage - 1)*3
			-- now we re-apply boxes
			for i, frame in ipairs(UIObjectsTable) do

				if(skipCount == skip)then
					
					CreateEditBoxFrames(frame, count)
					count = count + 1
					if(count == 3)then
						break
					end
				else
					skipCount = skipCount + 1
				end
			end

		end)

		CreateOptionFrames(count)
	end

end

function UpdateCustomThemeSettings()

	local strataTable = {
		"BACKGROUND",
		"LOW",
		"MEDIUM",
		"HIGH",
		"DIALOG",
		"FULLSCREEN",
		"FULLSCREEN_DIALOG",
		"TOOLTIP"
	}
	local drawLayerTable = {
		"BACKGROUND",
		"BORDER",
		"ARTWORK",
		"OVERLAY",
		"HIGHLIGHT"
	}
	local pointTable = {
		"TOPLEFT",
		"TOP",
		"TOPRIGHT",
		"LEFT",
		"CENTER",
		"RIGHT",
		"BOTTOMLEFT",
		"BOTTOM",
		"BOTTOMRIGHT"
	}

	function CheckLayerValidity(type, input)

		if(type == 1)then

			local match = false
			for k,v in pairs(strataTable) do
				if(v == input) then
					match = true
				end
			end
			return match

		elseif(type == 2)then

			local match = false
			for k,v in pairs(drawLayerTable) do
				if(v == input) then
					match = true
				end
			end
			return match
		end

	end

	function CheckPointValidity(input)

		local match = false
		for k,v in pairs(pointTable) do
			if(v == input) then
				match = true
			end
		end
		return match
	end

	for number=0, 2, 1 do
		
		local frameName = currentCustomFrameNames[number]

		for k, v in ipairs(editBoxFramesTable) do

			local boxName = "EditBox_"..number.."_"..v
			local currentEditBox = _G[boxName]

			if(currentEditBox)then
				if(currentEditBox:IsVisible())then
					if(v == "Backdrop")then
						wc3UI_Options.edit_theme_settings[wc3UI_Options.theme][frameName][v] = {['bgFile'] = currentEditBox:GetText()}
					elseif(v == "Hide")then
						local isHidden = currentEditBox:GetChecked()
						if(isHidden)then
							isHidden = true
						else
							isHidden = false
						end
						wc3UI_Options.edit_theme_settings[wc3UI_Options.theme][frameName][v] = isHidden
					elseif(v == "ParentOf" or v == "ParentPosOf")then
						if(_G[currentEditBox:GetText()] ~= nil)then
							wc3UI_Options.edit_theme_settings[wc3UI_Options.theme][frameName][v] = currentEditBox:GetText()
						else
							wc3UI_Options.edit_theme_settings[wc3UI_Options.theme][frameName][v] = "UIParent"
							currentEditBox:SetText("UIParent")
							ChatFrame1:AddMessage("|c00FF0303WIIIUI WARNING - Could not find parent frame, setting parent to UIParent")
						end
					elseif(v == "FrameStrata" or v == "SetDrawLayer")then
						local typeCheck
						if(v == "FrameStrata")then
							typeCheck = 1 --FrameStrata
						else
							typeCheck = 2 --SetDrawLayer
						end

						if( CheckLayerValidity(tonumber(typeCheck), currentEditBox:GetText()) == true )then
							wc3UI_Options.edit_theme_settings[wc3UI_Options.theme][frameName][v] = currentEditBox:GetText()
						else
							wc3UI_Options.edit_theme_settings[wc3UI_Options.theme][frameName][v] = "BACKGROUND"
							currentEditBox:SetText("BACKGROUND")
							ChatFrame1:AddMessage("|c00FF0303WIIIUI WARNING - Could not find a valid option, setting value to BACKGROUND")
						end
					elseif(v == "Point" or v == "RelativePoint")then
						if( CheckPointValidity(currentEditBox:GetText()) == true)then
							wc3UI_Options.edit_theme_settings[wc3UI_Options.theme][frameName][v] = currentEditBox:GetText()
						else
							wc3UI_Options.edit_theme_settings[wc3UI_Options.theme][frameName][v] = "CENTER"
							currentEditBox:SetText("CENTER")
							ChatFrame1:AddMessage("|c00FF0303WIIIUI WARNING - Could not find a valid option, setting value to CENTER")
						end
					elseif(v == "PosX" or v == "PosY" or v == "Width" or v == "Height" or v == "Transparency" or v == "FrameLevel" or v == "TexCoordLeft" or v == "TexCoordRight" or v == "TexCoordTop" or v == "TexCoordBottom")then
						if(currentEditBox:GetText() ~= "" and tonumber(currentEditBox:GetText()) ~= nil)then
							wc3UI_Options.edit_theme_settings[wc3UI_Options.theme][frameName][v] = currentEditBox:GetText()
						else
							wc3UI_Options.edit_theme_settings[wc3UI_Options.theme][frameName][v] = 1
							currentEditBox:SetText(1)
							ChatFrame1:AddMessage("|c00FF0303WIIIUI WARNING - Could not find a valid number, setting number to 1")
						end
					elseif(v == "Texture")then
						wc3UI_Options.edit_theme_settings[wc3UI_Options.theme][frameName][v] = currentEditBox:GetText()
					else
						wc3UI_Options.edit_theme_settings[wc3UI_Options.theme][frameName][v] = currentEditBox:GetText()
					end
				end
			end
			
		end
	end

end

function ApplyCustomThemeOptions()

	if(wc3UI_Options.EnableCustomize)then
	
		if(wc3UI_Options.edit_theme_settings[wc3UI_Options.theme])then
			
			local themeSettings = wc3UI_Options.edit_theme_settings[wc3UI_Options.theme]

			for k,v in pairs(themeSettings) do 

				-- ignore these
				if( string.find(_G[k]:GetName(), "Wc3_UI_weaponIcon_tex_") or string.find(_G[k]:GetName(), "Wc3_UI_armorIcon_tex") 
					or string.find(_G[k]:GetName(), "Wc3_UI_weapon") or string.find(_G[k]:GetName(), "WIIIUI_weapon") 
					or string.find(_G[k]:GetName(), "ActionButton_Custom1Icon") or string.find(_G[k]:GetName(), "ActionButton_Custom1NormalTexture")
					or string.find(_G[k]:GetName(), "ActionButton_Custom2Icon") or string.find(_G[k]:GetName(), "ActionButton_Custom2NormalTexture") 
					or string.find(_G[k]:GetName(), "ActionButton_Custom3Icon") or string.find(_G[k]:GetName(), "ActionButton_Custom3NormalTexture")
					or string.find(_G[k]:GetName(), "ActionButton_Custom1Icon") or string.find(_G[k]:GetName(), "ActionButton_Custom1")
					or string.find(_G[k]:GetName(), "ActionButton_Custom2Icon") or string.find(_G[k]:GetName(), "ActionButton_Custom2") 
					or string.find(_G[k]:GetName(), "ActionButton_Custom3Icon") or string.find(_G[k]:GetName(), "ActionButton_Custom3")
					or string.find(_G[k]:GetName(), "ActionButton_CustomInventory_1Icon") or string.find(_G[k]:GetName(), "ActionButton_CustomInventory_1NormalTexture") 
					or string.find(_G[k]:GetName(), "ActionButton_CustomInventory_2Icon") or string.find(_G[k]:GetName(), "ActionButton_CustomInventory_2NormalTexture") 
					or string.find(_G[k]:GetName(), "ActionButton_CustomInventory_3Icon") or string.find(_G[k]:GetName(), "ActionButton_CustomInventory_3NormalTexture") 
					or string.find(_G[k]:GetName(), "ActionButton_CustomInventory_4Icon") or string.find(_G[k]:GetName(), "ActionButton_CustomInventory_4NormalTexture") 
					or string.find(_G[k]:GetName(), "ActionButton_CustomInventory_5Icon") or string.find(_G[k]:GetName(), "ActionButton_CustomInventory_5NormalTexture") 
					or string.find(_G[k]:GetName(), "ActionButton_CustomInventory_6Icon") or string.find(_G[k]:GetName(), "ActionButton_CustomInventory_6NormalTexture")
					or string.find(_G[k]:GetName(), "ActionButton_CustomInventory_1Icon") or string.find(_G[k]:GetName(), "ActionButton_CustomInventory_1") 
					or string.find(_G[k]:GetName(), "ActionButton_CustomInventory_2Icon") or string.find(_G[k]:GetName(), "ActionButton_CustomInventory_2") 
					or string.find(_G[k]:GetName(), "ActionButton_CustomInventory_3Icon") or string.find(_G[k]:GetName(), "ActionButton_CustomInventory_3") 
					or string.find(_G[k]:GetName(), "ActionButton_CustomInventory_4Icon") or string.find(_G[k]:GetName(), "ActionButton_CustomInventory_4") 
					or string.find(_G[k]:GetName(), "ActionButton_CustomInventory_5Icon") or string.find(_G[k]:GetName(), "ActionButton_CustomInventory_5") 
					or string.find(_G[k]:GetName(), "ActionButton_CustomInventory_6Icon") or string.find(_G[k]:GetName(), "ActionButton_CustomInventory_6")
					or string.find(_G[k]:GetName(), "Wc3_UI_xpProgBarRested") or string.find(_G[k]:GetName(), "ActionButton_CustomInventory_6")
					or string.find(_G[k]:GetName(), "Wc3_UI_xpProgBar") or string.find(_G[k]:GetName(), "ActionButton_CustomInventory_6")
					or string.find(_G[k]:GetName(), "WIIIUI_armorValues") or string.find(_G[k]:GetName(), "ActionButton_CustomInventory_6")
					or string.find(_G[k]:GetName(), "WIIIUI_weaponIcon_1") or string.find(_G[k]:GetName(), "ActionButton_CustomInventory_6")
					or string.find(_G[k]:GetName(), "WIIIUI_weaponIcon_2") or string.find(_G[k]:GetName(), "ActionButton_CustomInventory_6")
					or string.find(_G[k]:GetName(), "WIIIUI_weaponIcon_3") or string.find(_G[k]:GetName(), "ActionButton_CustomInventory_6")
				) then

				else

					local currentFrame = _G[k]
					local baseScale = wc3UI_Options.base_scale
					local scale = wc3UI_Options.uiScale
					local isHidden = v["Hide"]

					currentFrame:SetParent(v['ParentOf'])
					currentFrame:SetAlpha(v['Transparency'])
					currentFrame:SetWidth( (v['Width']/baseScale) * scale )
					currentFrame:SetHeight( (v['Height']/baseScale) * scale)

					if(isHidden)then
						currentFrame:Hide()
					else
						currentFrame:Show()
					end

					if(v['ParentPosOf'] and v['RelativePoint'])then
						currentFrame:SetPoint( v['Point'], v['ParentPosOf'], v['RelativePoint'], (v['PosX']/baseScale) * scale, (v['PosY']/baseScale) * scale)
					elseif(v['ParentPosOf'])then
						currentFrame:SetPoint(v['Point'], v['ParentPosOf'], (v['PosX']/baseScale) * scale, (v['PosY']/baseScale) * scale)
					else
						currentFrame:SetPoint(v['Point'], (v['PosX']/baseScale) * scale, (v['PosY']/baseScale) * scale)
					end

					if(currentFrame:GetObjectType() == "Frame" or currentFrame:GetObjectType() == "Minimap")then

						currentFrame:SetFrameStrata(v['FrameStrata'])
						currentFrame:SetFrameLevel(v['FrameLevel'])
						if(v['Backdrop'] ~= "")then
							currentFrame:SetBackdrop({bgFile = v['Backdrop']['bgFile']})
						end
						
					elseif(currentFrame:GetObjectType() == "Texture")then

						currentFrame:SetTexture(v['Texture'])
						currentFrame:SetDrawLayer(v['SetDrawLayer'])
						currentFrame:SetTexCoord(v['TexCoordLeft'], v['TexCoordRight'], v['TexCoordTop'], v['TexCoordBottom'])

					end
				end
			end
		end

		-- Minimap fix
		Minimap:SetZoom(Minimap:GetZoom()+1)
		Minimap:SetZoom(Minimap:GetZoom()-1)
	end
end

local resetCount = 0
function Reset_CustomSettings()

	resetCount = resetCount + 1
	local timer = 0
	WIIIUI_customizedMainFrameResetButton:SetScript("OnUpdate", function()
	
		timer = timer + arg1
		if(timer > 3)then
			resetCount = 0
			WIIIUI_customizedMainFrameResetButton:SetScript("OnUpdate", nil)
		end

	end)

	if(resetCount > 2)then
		resetCount = 0
		
		local tempTable = {}
		for frame, elements in pairs(wc3UI_Options['base_settings'][wc3UI_Options.theme]) do
			
			tempTable[frame] = {frame}
			
			for element, value in pairs(elements) do
				tempTable[frame][element] = value
			end
		end
		wc3UI_Options.edit_theme_settings[wc3UI_Options.theme] = {}
		wc3UI_Options.edit_theme_settings[wc3UI_Options.theme] = tempTable

		CreateCustomizedFrames()
		ApplyCustomThemeOptions()
		
		WIIIUI_customizedMainFrameResetButton:SetScript("OnUpdate", nil)
	end

end

function ApplyOnDragFunction()

	MiniMapBattlefieldFrame:RegisterForDrag("LeftButton")
	MiniMapBattlefieldFrame:SetMovable()
	MiniMapBattlefieldFrame:SetScript("OnDragStart", function()
		MiniMapBattlefieldFrame:StartMoving()
	end)

	MiniMapBattlefieldFrame:SetScript("OnDragStop", function()
		MiniMapBattlefieldFrame:StopMovingOrSizing()
		MiniMapBattlefieldFrame:SetUserPlaced();
		__, __, __, wc3UI_Options.MiniMapBattlefieldFrameX, wc3UI_Options.MiniMapBattlefieldFrameY = MiniMapBattlefieldFrame:GetPoint()
	end)
end

function PlaceMiniMapBattleFrame()

	if(wc3UI_Options.MiniMapBattlefieldFrameX ~= nil)then
		local x, y = wc3UI_Options.MiniMapBattlefieldFrameX, wc3UI_Options.MiniMapBattlefieldFrameY
		MiniMapBattlefieldFrame:SetPoint("BOTTOMLEFT", nil, "TOPLEFT", x, y - 33)	
	end
	MiniMapBattlefieldFrame:SetFrameStrata("HIGH")

end

function PutHearthstoneInActionBar()

	local actionBarID = 115

	if(HasAction(actionBarID) == nil)then

		local hearthstoneFound
		local numberOfSlots
		local itemLink, itemString, itemName
		
		hearthstoneFound = false

		for bag = 0, 4, 1 do
			numberOfSlots = GetContainerNumSlots(bag)
			
			for inventorySlot = 1, numberOfSlots, 1 do 
				itemLink = GetContainerItemLink(bag,inventorySlot)
				if(itemLink ~= nil) then
					itemString, stringEnd = string.find(itemLink, "item[%-?%d:]+")
					itemLink = string.sub(itemLink, itemString, stringEnd)
					itemName = GetItemInfo(itemLink)
					if(itemName == "Hearthstone")then
						hearthstoneFound = true
						PickupContainerItem(bag, inventorySlot)
						PlaceAction(actionBarID)
						break
					end
				end
			end
			if(hearthstoneFound)then
				break
			end
        end

	end
end

function HideMinimapActionButtonFrame(number)

	local actionButtonFrameNormalTexture = _G['ActionButton_Custom'..number..'NormalTexture']
	actionButtonFrameNormalTexture:SetTexture("")
	actionButtonFrameNormalTexture:SetWidth(-1)
	actionButtonFrameNormalTexture:SetHeight(-1)

end

function Minimap_ActionButtons(number)
	
	local hsCD_Center, hsMain_Center, offsetPixels
	local customActionButton, ActionButton_CustomCooldown, actionButtonNormalTexture
	local actionButtonIcon, zoomInPixels


	local resizeIcon = 0 -- width and height
	local addWidth = 0 -- add width alignment
	local addHeight = 0	-- add heigh alignment

	customActionButton = _G['ActionButton_Custom'..number]
	ActionButton_CustomCooldown = _G['ActionButton_Custom'..number..'Cooldown']

	if(wc3UI_Options.theme == "orc")then

		resizeIcon = 3
		addWidth = 2
		addHeight = 1
	elseif(wc3UI_Options.theme == "human")then

		resizeIcon = 4
		addWidth = 2
		addHeight = 2

	elseif(wc3UI_Options.theme == "undead")then
		resizeIcon = 4
		addWidth = 2
		addHeight = 2

	elseif(wc3UI_Options.theme == "nightelf")then
		resizeIcon = 4
		addWidth = 2
		addHeight = 2
	end

	customActionButton:ClearAllPoints()
	customActionButton:SetWidth(wc3UI_Options.uiScale*0.08518 - resizeIcon)
	customActionButton:SetHeight(wc3UI_Options.uiScale*0.08518 - resizeIcon)
	customActionButton:SetPoint("BOTTOMLEFT", Minimap, "BOTTOMRIGHT", wc3UI_Options.uiScale*0.01851 + addWidth, wc3UI_Options.uiScale*0.455555 - ((number-1) * (wc3UI_Options.uiScale*0.08518)) - (floor(number*0.34)) + addHeight )
	customActionButton:SetBackdrop( { 
		bgFile = "", 
		edgeFile = ""
	})

	ActionButton_CustomCooldown:SetAllPoints()
	ActionButton_CustomCooldown:SetBackdrop(nil)

	-- We calculate to put the cooldown frame on the center position of customActionButton
	hsCD_Center = ActionButton_CustomCooldown:GetWidth()/2
	hsMain_Center = customActionButton:GetWidth()/2
	offsetPixels = (hsCD_Center - hsMain_Center) / GetScreenWidth()
	ActionButton_CustomCooldown:SetPosition( -offsetPixels, -offsetPixels, 0 );

	-- Normal texture 
	actionButtonNormalTexture = _G['ActionButton_Custom'..number..'NormalTexture']
	
	-- Hide icon frames
	if(true) then
		actionButtonNormalTexture:SetWidth(-1)
		actionButtonNormalTexture:SetHeight(-1)
		--Zoom in
		actionButtonIcon = _G['ActionButton_Custom'..number..'Icon']
		zoomInPixels = wc3UI_Options.uiScale*0.01851
		zoomInPixels = (zoomInPixels/actionButtonIcon:GetWidth())

		actionButtonIcon:SetTexCoord(zoomInPixels, 1-zoomInPixels, zoomInPixels, 1-zoomInPixels);
	end

	ActionButton_Custom1NormalTexture:Hide()
	HideMinimapActionButtonFrame(number)
end

function CheckIfInForm()

	local icon, name, active, castable
	local foundShapeshift
	local iconWeapon, iconArmor, iconName

	if(UnitClass("player") == "Druid") then		

		for counter = 1, 10, 1 do
			icon, name, active, castable = GetShapeshiftFormInfo(counter);
			if(name == nil)then
				return false
			end

			foundShapeshift = false
			if(active)then
				if(name == "Bear Form")then
					foundShapeshift = true
					iconWeapon = "Interface\\Icons\\INV_Misc_MonsterClaw_04"
					iconArmor = "Interface\\Icons\\Ability_Racial_BearForm"

				elseif(name == "Dire Bear Form")then
					foundShapeshift = true
					iconWeapon = "Interface\\AddOns\\WIIIUI\\art\\other\\direbear_claw"
					iconArmor = "Interface\\Icons\\Ability_Racial_BearForm"
					
				elseif(name == "Cat Form") then
					foundShapeshift = true
					iconWeapon = "Interface\\Icons\\Ability_Druid_Rake"
					iconArmor = "Interface\\Icons\\Ability_Druid_CatForm"

				elseif(name == "Aquatic Form") then
					foundShapeshift = true
					iconWeapon = "Interface\\Icons\\ABILITY_SEAL"
					iconArmor = "Interface\\Icons\\Ability_Druid_AquaticForm"

				elseif(name == "Travel Form") then
					foundShapeshift = true
					iconWeapon = "Interface\\Icons\\Spell_Shadow_VampiricAura"
					iconArmor = "Interface\\Icons\\Ability_Druid_TravelForm"

				elseif(name == "Moonkin Form") then
					foundShapeshift = true
					SetWeaponIcon()
					SetArmorIcon()
					--iconArmor = "Interface\\Icons\\Ability_Druid_ImprovedMoonkinForm"
					--SetArmorIcon(iconArmor)
					return true
				end

				if(foundShapeshift) then
					SetWeaponIcon(iconWeapon)
					SetArmorIcon(iconArmor)

					return true
				end
			end
		end
	end

	if(UnitClass("player") == "Shaman") then

		-- check if ghost wolf buff is up
		for counter = 1, 40, 1 do
			foundShapeshift = false

			iconName = UnitBuff("player", counter)
			if(iconName == nil)then
				return false
			end

			if(iconName == "Interface\\Icons\\Spell_Nature_SpiritWolf")then
				iconWeapon = "Interface\\Icons\\Ability_Hunter_Pet_Wolf"
				iconArmor = "Interface\\Icons\\Spell_Nature_SpiritWolf"
				SetWeaponIcon(iconWeapon)
				SetArmorIcon(iconArmor)
				foundShapeshift = true
				return true
			end
		end
	end
end

function SetWeaponIcon(custom)

	local icon

	if(custom and weaponIconSelected == 16)then
		icon = custom
	else
		if(weaponIconSelected == nil)then
			icon = GetInventoryItemTexture("player", 16)
		else
			if(weaponIconSelected == "none")then
				weaponMainFrame:Hide()
			else
				weaponMainFrame:Show()
				if(weaponIconSelected == 98 or weaponIconSelected == 99)then

					if(weaponIconSelected == 98)then
						icon = "Interface\\Icons\\Spell_Holy_Heal"
					elseif(weaponIconSelected == 99)then
						icon = "Interface\\Icons\\INV_Staff_07"
					end

				else
					icon = GetInventoryItemTexture("player", weaponIconSelected)
				end
			end
		end
	end

	weaponIcon:SetBackdrop({
		bgFile = (icon or "Interface\\AddOns\\WIIIUI\\art\\other\\fist" )
	})
	if(icon == nil)then
		if( weaponIconSelected == 17 or  weaponIconSelected == 18 or weaponIconSelected == 0)then
			weaponNumbersText:SetText( "N/A" )
		end
	else
		
		if(weaponIconSelected == 0) then
			
		end
	end
end

function SetArmorIcon(custom)

	local icon

	if(custom)then
		icon = custom
	else
		icon = GetInventoryItemTexture("player", 5)
	end
	armorIcon:SetBackdrop({
		bgFile = (icon or "Interface/Icons/INV_Misc_Cape_10" )
	})
end

function CreatePlayerPortrait()
	if (_G['CustomPlayerModelPortrait']) then
		-- already created.
	else
		PortraitCustom = CreateFrame("PlayerModel", "CustomPlayerModelPortrait", leftFrame)
	end
end

function ModifyPlayerPortrait()

	local time
	local animId

	PortraitCustom:SetFrameStrata("LOW")
	PortraitCustom:SetFrameLevel(0)
	
	PortraitCustom:SetUnit("player")
	PortraitCustom:SetCamera(0)
	PortraitCustom:SetSequenceTime(4, 1)

	-- If stop animation
	if(wc3UI_Options.StopAnimation == true)then
		time = 0
		animId = 3
		PortraitCustom:SetScript("OnUpdate", function(self)

            PortraitCustom:SetSequenceTime(animId, time)
            time = time + 8	
        end)
	else
		PortraitCustom:SetScript("OnUpdate", nil)
	end

	PortraitCustom:SetScript("OnEvent", function()

		if(arg1 == "player")then
			PortraitCustom:SetUnit("player")
			PortraitCustom:SetCamera(0)

			WIIIUI_HealthText:SetText(UnitHealth("player").." / ".. UnitHealthMax("player"));
			WIIIUI_PowerText:SetText(UnitMana("player").." / ".. UnitManaMax("player"));
		end
	end)

	PortraitCustom:RegisterEvent("PLAYER_LOGIN");
	PortraitCustom:RegisterEvent("UNIT_MODEL_CHANGED")
	-- background for player Portrait
	PortraitBackground:SetPoint("CENTER", CustomPlayerModelPortrait, "CENTER", 0, 0)

	PortraitCustom:SetPoint("BOTTOMLEFT", minimapFrame, "BOTTOMLEFT", wc3UI_Options.uiScale*0.86 - (100 - wc3UI_Options.PortraitAlignmentX), wc3UI_Options.uiScale*0.10 - (100 - wc3UI_Options.PortraitAlignmentY))
	PortraitCustom:SetWidth(wc3UI_Options.uiScale*0.27 + wc3UI_Options.portraitScale)
	PortraitCustom:SetHeight(wc3UI_Options.uiScale*0.27 + wc3UI_Options.portraitScale)
	
	PortraitBackground:SetWidth(wc3UI_Options.uiScale*0.35)
	PortraitBackground:SetHeight(wc3UI_Options.uiScale*0.35 + 20)
end

function AlignMinimap()

	local extraAlign, zoomInPixels

	minimapFrame:SetWidth(wc3UI_Options.uiScale)
	minimapFrame:SetHeight(wc3UI_Options.uiScale)

	Minimap:ClearAllPoints()
	Minimap:SetParent(UIParent)
	Minimap:Show()
	Minimap:SetPoint("CENTER", minimapFrame, "CENTER", wc3UI_Options.uiScale*-0.189, wc3UI_Options.uiScale*-0.20)
	Minimap:SetFrameStrata("LOW")
	Minimap:SetFrameLevel(1)
	Minimap:SetWidth(wc3UI_Options.uiScale*0.55)
	Minimap:SetHeight(wc3UI_Options.uiScale*0.55)
	Minimap:SetZoom(Minimap:GetZoom()+1)
	Minimap:SetZoom(Minimap:GetZoom()-1)

	MiniMapTrackingFrame:ClearAllPoints()
	MiniMapTrackingFrame:SetPoint("CENTER", minimapFrame, "CENTER", wc3UI_Options.uiScale*0.14, wc3UI_Options.uiScale*-0.34)

	MinimapZoneTextButton:ClearAllPoints()
	MinimapZoneTextButton:SetParent(Minimap)
	MinimapZoneTextButton:SetPoint("BOTTOM", Minimap, "BOTTOM", 0, 1)
	MinimapZoneTextButton:Show()

	MiniMapMailBorder:Hide()
	MiniMapMailFrame:ClearAllPoints()
	MiniMapMailFrame:SetPoint("BOTTOMLEFT", Minimap, "BOTTOMRIGHT",wc3UI_Options.uiScale*-0.0054,wc3UI_Options.uiScale*0.18)
	MiniMapMailIcon:SetWidth(wc3UI_Options.uiScale*0.085 - 3)
	MiniMapMailIcon:SetHeight(wc3UI_Options.uiScale*0.085 - 3)

	extraAlign = 0
	if(wc3UI_Options.theme == "human")then
		if( wc3UI_Options.uiScale > 256 and wc3UI_Options.uiScale <= 263)then
			extraAlign = 1
		elseif( wc3UI_Options.uiScale > 243 and wc3UI_Options.uiScale <= 256)then
			extraAlign = 2
		elseif( wc3UI_Options.uiScale >= 240 and wc3UI_Options.uiScale <= 243)then
			extraAlign = 3
		end
		MiniMapMailFrame:SetPoint("BOTTOMLEFT", Minimap, "BOTTOMRIGHT", 0, wc3UI_Options.uiScale*0.17037037 - extraAlign)
	elseif(wc3UI_Options.theme == "orc")then
		if( wc3UI_Options.uiScale > 256 and wc3UI_Options.uiScale <= 263)then
			extraAlign = 1
		elseif( wc3UI_Options.uiScale > 243 and wc3UI_Options.uiScale <= 256)then
			extraAlign = 2
		elseif( wc3UI_Options.uiScale >= 240 and wc3UI_Options.uiScale <= 243)then
			extraAlign = 3
		end
		MiniMapMailFrame:SetPoint("BOTTOMLEFT", Minimap, "BOTTOMRIGHT", 0, wc3UI_Options.uiScale*0.17037037 - extraAlign)
	end
	-- Hide icon frames
	--MiniMapMailNormalTexture:SetWidth(-1)
	--MiniMapMailNormalTexture:SetHeight(-1)
	--Zoom in
	zoomInPixels =2
	zoomInPixels = (zoomInPixels/MiniMapMailIcon:GetWidth())
	MiniMapMailIcon:SetTexCoord(zoomInPixels, 1-zoomInPixels, zoomInPixels, 1-zoomInPixels);


	noMail:SetWidth(wc3UI_Options.uiScale*0.085)
	noMail:SetHeight(wc3UI_Options.uiScale*0.085)
	noMail:SetPoint("BOTTOMLEFT", Minimap, "BOTTOMRIGHT", wc3UI_Options.uiScale * 0.01851, wc3UI_Options.uiScale * 0.19259)
	noMail:SetVertexColor(0.25, 0.25, 0.25, 1)

	Minimap_ActionButtons(1)
	Minimap_ActionButtons(2)
	Minimap_ActionButtons(3)
end

function AlignZoneText()

	MinimapZoneTextButton:Show()
	
	if(wc3UI_Options.ZoneTextPos == 1)then
		MinimapZoneTextButton:SetPoint("BOTTOM", Minimap, "BOTTOM", 0, 1)
	elseif(wc3UI_Options.ZoneTextPos == 2)then
		MinimapZoneTextButton:SetPoint("BOTTOM", Minimap, "BOTTOM", 0, wc3UI_Options.uiScale*0.5)
	elseif(wc3UI_Options.ZoneTextPos == 3)then
		MinimapZoneTextButton:Hide()
	end
end

function AlignBuffFrame()

	local function Aligner()

		local tempEnchantCount = 0
		local spacing = 35

		if(TempEnchant1:IsVisible())then
			tempEnchantCount = tempEnchantCount + 1
			TempEnchant1:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -10, -10)
		end
		if(TempEnchant2:IsVisible())then
			tempEnchantCount = tempEnchantCount + 1
			TempEnchant2:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -10 - ((tempEnchantCount - 1) * spacing), -10)
		end
		BuffButton0:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -10 - ((tempEnchantCount) * spacing), -10)
		BuffButton16:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -10, -100)

	end

	TempEnchant1:SetScript("OnShow", function()
		Aligner()
	end)
	TempEnchant1:SetScript("OnHide", function()
		Aligner()
	end)

	TempEnchant2:SetScript("OnShow", function()
		Aligner()
	end)
	TempEnchant2:SetScript("OnHide", function()
		Aligner()
	end)

	if(wc3UI_Options.buffTopRight)then
		Aligner()
	end
end

function ReAlignBuffFrame()

	if(wc3UI_Options.buffTopRight)then
		AlignBuffFrame()
	else
		ChatFrame1:AddMessage("|cffff0000WIIIUI WARNING - PLEASE RELOAD UI TO APPLY BUFF POSITION CHANGE")
	end
end

function AlignPortrait()

	portraitFrame:SetWidth(wc3UI_Options.uiScale)
	portraitFrame:SetHeight(wc3UI_Options.uiScale)
	portraitFrame:SetPoint("BOTTOMLEFT", minimapFrame, "BOTTOMRIGHT", 0, 0)

	PortraitCustom:EnableMouse()
	PortraitCustom:SetScript("OnMouseDown", function()

		if(arg1 == "RightButton")then
			ToggleDropDownMenu(1, nil, PlayerFrameDropDown, "PortraitCustom", 0, 27)

		elseif(arg1 == "LeftButton")then
			TargetUnit("player")
		end
	end)
end

function UIHideFix()

	local elapsedTime

	dummyFrame:SetScript("OnHide", function()
		PortraitBackgroundMain:Hide()
		barTextFrame:Hide()
	end)
	dummyFrame:SetScript("OnShow", function()
		PortraitBackgroundMain:Show()
		barTextFrame:Show()
		elapsedTime = 0
		dummyFrame:SetScript("OnUpdate", function()
			
			elapsedTime = elapsedTime + arg1
			if(elapsedTime > 0) then
				PortraitCustom:SetCamera(0)
				dummyFrame:SetScript("OnUpdate", nil)
			end
		end)
	end)
end

function AlignHealthMana()

	local healthPercent, powerPercent

	PlayerFrameHealthBar:SetParent(UIParent)
	PlayerFrameManaBar:SetParent(UIParent)

	PlayerFrameHealthBar:ClearAllPoints()
	PlayerFrameHealthBar:SetPoint("BOTTOMLEFT", minimapFrame, "BOTTOMRIGHT", wc3UI_Options.uiScale*-0.147, wc3UI_Options.uiScale*0.07)
	PlayerFrameHealthBar:SetFrameStrata("LOW")
	PlayerFrameHealthBar:SetFrameLevel(2)
	PlayerFrameHealthBar:SetWidth(wc3UI_Options.uiScale*0.27)
	PlayerFrameHealthBar:SetHeight(wc3UI_Options.uiScale*0.03)
	
	barTextFrame:SetFrameLevel(5)
	barTextFrame:SetFrameStrata("LOW")

	WIIIUI_HealthText:ClearAllPoints()
	WIIIUI_HealthText:SetPoint("CENTER", PlayerFrameHealthBar, 0, 0)
	WIIIUI_HealthText:SetFont("Interface\\AddOns\\WIIIUI\\art\\other\\fonts\\blq55.TTF", 10, "")
	if(wc3UI_Options.HealthPercent)then
		healthPercent = (UnitHealth("player")/UnitHealthMax("player"));
		healthPercent = healthPercent * 100
		healthPercent = string.format("%.0f%%", healthPercent)
		WIIIUI_HealthText:SetText(healthPercent);
	else
		WIIIUI_HealthText:SetText(UnitHealth("player").." / ".. UnitHealthMax("player"));
	end
		
	PlayerFrameManaBar:ClearAllPoints()
	PlayerFrameManaBar:SetPoint("BOTTOMLEFT", minimapFrame, "BOTTOMRIGHT", wc3UI_Options.uiScale*-0.147, wc3UI_Options.uiScale*0.02)
	PlayerFrameManaBar:SetFrameStrata("LOW")
	PlayerFrameManaBar:SetFrameLevel(4)
	PlayerFrameManaBar:SetWidth(wc3UI_Options.uiScale*0.27)
	PlayerFrameManaBar:SetHeight(wc3UI_Options.uiScale*0.03)

	WIIIUI_PowerText:ClearAllPoints()
	WIIIUI_PowerText:SetPoint("CENTER", PlayerFrameManaBar, 0, 0)
	WIIIUI_PowerText:SetFont("Interface\\AddOns\\WIIIUI\\art\\other\\fonts\\blq55.TTF", 9, "")
	if(wc3UI_Options.PowerPercent)then
		powerPercent = (UnitMana("player")/UnitManaMax("player"));
		powerPercent = powerPercent * 100
		powerPercent = string.format("%.0f%%", powerPercent)
		WIIIUI_PowerText:SetText(powerPercent);
	else
		WIIIUI_PowerText:SetText(UnitMana("player").." / ".. UnitManaMax("player"));
	end
	
	leftFrame:SetScript("OnEvent", function()

		if(arg1 == "player")then
			if(wc3UI_Options.HealthPercent)then
				healthPercent = (UnitHealth("player")/UnitHealthMax("player"));
				healthPercent = healthPercent * 100
				healthPercent = string.format("%.0f%%", healthPercent)
				WIIIUI_HealthText:SetText(healthPercent);
			else
				WIIIUI_HealthText:SetText(UnitHealth("player").." / ".. UnitHealthMax("player"));
			end

			if(wc3UI_Options.PowerPercent)then
				powerPercent = (UnitMana("player")/UnitManaMax("player"));
				powerPercent = powerPercent * 100
				powerPercent = string.format("%.0f%%", powerPercent)
				WIIIUI_PowerText:SetText(powerPercent);
			else
				WIIIUI_PowerText:SetText(UnitMana("player").." / ".. UnitManaMax("player"));
			end
		end
	end)
	leftFrame:RegisterEvent("UNIT_HEALTH");
	leftFrame:RegisterEvent("UNIT_MAXHEALTH");
	leftFrame:RegisterEvent("UNIT_RAGE");
	leftFrame:RegisterEvent("UNIT_ENERGY");
	leftFrame:RegisterEvent("UNIT_MANA");

	PlayerFrameManaBar:Hide()
	PlayerFrameManaBar:Show()

end

function CombatTextPortrait()

	PlayerFrame:Show()
	PlayerFrame:ClearAllPoints()

	-- Create dummy frame to align combat chat text properly
	if(not _G['dummyFrameCombatText'] )then
		dummyFrameCombatText = CreateFrame("Frame", "dummyFrameCombatText", UIParent, nil)
	end
	dummyFrameCombatText:SetWidth(wc3UI_Options.uiScale*0.27)
	dummyFrameCombatText:SetHeight(wc3UI_Options.uiScale*0.27)
	dummyFrameCombatText:SetPoint("BOTTOMLEFT", minimapFrame, "BOTTOMLEFT", wc3UI_Options.uiScale*0.86, wc3UI_Options.uiScale*0.10)
	PortraitBackground:SetPoint("CENTER", dummyFrameCombatText, "CENTER", 0, 0)

	PlayerHitIndicator:SetPoint("CENTER", dummyFrameCombatText, "CENTER", 0, wc3UI_Options.uiScale*0.022222222)

	PlayerFrame:SetWidth(wc3UI_Options.uiScale*0.44230769)
	PlayerFrame:SetFrameStrata("LOW")
	PlayerFrame:SetFrameLevel(500)
	PlayerFrame:SetBackdrop(nil)
	PlayerFrameBackground:SetTexture("")
	PlayerFrameGroupIndicator:SetAlpha(0)
	PlayerAttackBackground:SetAlpha(0)
	PlayerPortrait:SetTexture("")
	PlayerPortrait:Hide()
	PlayerFrameTexture:SetTexture("")
	PlayerStatusTexture:SetTexture("")
	PlayerFrameManaBarText:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 0, -300)
	PlayerFrameHealthBarText:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 0, -300)
	PlayerName:Hide()
	PlayerLevelText:Hide()
end

function AlignXPBar()

	local xpScaling, xpTime
	local restedXpCalc

	xpScaling = 0.375
	xpBarMainFrame:SetPoint("BOTTOMLEFT", portraitFrame, "BOTTOMLEFT", wc3UI_Options.uiScale*0.23, wc3UI_Options.uiScale*0.3)
	xpBarLeft:SetWidth( (wc3UI_Options.uiScale*0.05924) * xpScaling)
	xpBarLeft:SetHeight( (wc3UI_Options.uiScale*0.2370) * xpScaling)
	xpBarMiddle:SetPoint("BOTTOMLEFT", xpBarLeft, "BOTTOMRIGHT", 0, 0)
	xpBarMiddle:SetWidth( (wc3UI_Options.uiScale*1.70) * xpScaling)
	xpBarMiddle:SetHeight( (wc3UI_Options.uiScale*0.2370) * xpScaling)
	xpBarRight:SetPoint("BOTTOMLEFT", xpBarLeft, "BOTTOMRIGHT", xpBarMiddle:GetWidth(), 0)
	xpBarRight:SetWidth( (wc3UI_Options.uiScale*0.05924) * xpScaling)
	xpBarRight:SetHeight( (wc3UI_Options.uiScale*0.2370) * xpScaling)
	
	xpHoverFrame:SetPoint("BOTTOMLEFT", xpBarLeft, "BOTTOMRIGHT", 0, 0)
	xpHoverFrame:SetWidth(xpBarLeft:GetWidth() + xpBarMiddle:GetWidth() + xpBarRight:GetWidth() )
	xpHoverFrame:SetHeight(wc3UI_Options.uiScale*0.08)

	xpProgBar:SetPoint("CENTER", xpBarMiddle, "CENTER", 0, wc3UI_Options.uiScale*0.0)
	xpProgBar:SetHeight(wc3UI_Options.uiScale*0.083)

	if(UnitXP("player") == 0) then
		xpProgBar:SetWidth(1)
		if(UnitLevel("player") == MAX_LEVEL) then
			xpProgBar:SetWidth(xpProgBarMax)
		end
	else
		if(UnitXP("player") == UnitXPMax("player"))then
			xpProgBar:SetWidth(1)
		else
			xpProgBar:SetWidth( xpProgBarMax * ( UnitXP("player")/UnitXPMax("player") ) )
		end
	end
	xpProgBar:SetVertexColor(0.5, 0, 0.5, 1)

	MainMenuExpBar:Hide()
	MainMenuBarMaxLevelBar:Hide()
	
	xpBarMainFrame:SetScript('OnEvent', function()
		if(UnitXP("player") == 0) then
			xpProgBar:SetWidth( 1 )
			if(UnitLevel("player") == MAX_LEVEL) then
				xpProgBar:SetWidth(xpProgBarMax)
			end
		else
			xpProgBar:SetWidth( xpProgBarMax * ( UnitXP("player")/UnitXPMax("player") ) )
		end
		xpCurrLevel:SetText("Level "..UnitLevel("player").." "..UnitClass("player"))

		if(event == "PLAYER_LEVEL_UP")then

			MainMenuExpBar:Hide()
			MainMenuBarMaxLevelBar:Hide()
			
			xpTime = 0
			xpBarMainFrame:SetScript('OnUpdate', function()

				ExhaustionTick:Hide()

				if(wc3UI_Options.hideMicroButtons)then
					TalentMicroButton:Hide()
				else
					if(UnitLevel("player") >= 10)then
						TalentMicroButton:Show()
						AlignMicroButtons()
					end
				end	
				
				xpTime = xpTime + arg1
				if(xpTime > 3)then
					xpBarMainFrame:SetScript('OnUpdate', nil)
				end
			end)
		end

		if(event == "UPDATE_EXHAUSTION")then
			if( GetXPExhaustion() or 0 ~= 0)then
				restedXpCalc = (xpProgBarMax * ( UnitXP("player")/UnitXPMax("player")) + xpProgBarMax * ( GetXPExhaustion()/UnitXPMax("player") ))
			else
				restedXpCalc = 0
			end
		
			if(restedXpCalc >= xpProgBarMax) then
				xpProgBarRested:SetWidth(xpProgBarMax)
			else
				xpProgBarRested:SetWidth( max( restedXpCalc, 1) )
			end
		end

	end)
	xpBarMainFrame:RegisterEvent("PLAYER_XP_UPDATE")
	xpBarMainFrame:RegisterEvent("PLAYER_LEVEL_UP")
	xpBarMainFrame:RegisterEvent("UPDATE_EXHAUSTION")

	xpProgBarRested:SetPoint("CENTER", xpBarMiddle, "CENTER", 0, wc3UI_Options.uiScale*0.0)
	xpProgBarRested:SetHeight(wc3UI_Options.uiScale*0.083)
	xpProgBarRested:SetVertexColor(wc3UI_Options.xpRestedXpColor[1], wc3UI_Options.xpRestedXpColor[2], wc3UI_Options.xpRestedXpColor[3], wc3UI_Options.xpRestedXpColor[4]) -- purple rested 
	

	if( GetXPExhaustion() or 0 ~= 0)then
		restedXpCalc = (xpProgBarMax * ( UnitXP("player")/UnitXPMax("player")) + xpProgBarMax * ( GetXPExhaustion()/UnitXPMax("player") ))
	else
		restedXpCalc = 0
	end

	if(restedXpCalc >= xpProgBarMax) then
		xpProgBarRested:SetWidth(xpProgBarMax)
	else
		xpProgBarRested:SetWidth( max( restedXpCalc, 1) )
	end

	xpCharName:SetFont("Interface\\AddOns\\WIIIUI\\art\\other\\fonts\\blq55.TTF", 16, "")
	xpCharName:ClearAllPoints()
	xpCharName:SetPoint("CENTER", xpBarMiddle, "CENTER", 0, wc3UI_Options.uiScale*0.080)
	xpCharName:SetText(GetUnitName("player"))
	xpCharName:SetHeight(100)

	xpCurrLevel:SetFont("Interface\\AddOns\\WIIIUI\\art\\other\\fonts\\blq55.TTF", 12, "")
	xpCurrLevel:ClearAllPoints()
	xpCurrLevel:SetPoint("CENTER", xpBarMiddle, "CENTER", 0, wc3UI_Options.uiScale*0.0)
	xpCurrLevel:SetText("Level "..UnitLevel("player").." "..UnitClass("player"))


end

function AlignWeaponFrame(frameNumber)

	local alignerX, alignerY
	local weaponFrameScaling
	local lowDmg, highDmg, offLowDmg, offHiDmg, posBuff, negBuff, percentMod, percent, speed
	local text
	local value, isShield, blockChance
	local hp, sp
	local ammoSlot, currentAmmo
	local extraSpace
	local time

	local function UpdateAmmo()
		-- Ammo part
		ammoSlot = CharacterAmmoSlot:GetID();
		local rangedCount = GetInventoryItemCount("player", CharacterRangedSlot:GetID());
		if (rangedCount > 1) then
			ammoSlot = CharacterRangedSlot:GetID();
		end
		currentAmmo = GetInventoryItemCount("player", ammoSlot);
		-- End

		weaponDamageText:SetText("|cffffd100Ammo:|r")
		if(currentAmmo < 200)then
			text = "|cffff0000"
		elseif(currentAmmo < 400)then
			text = "|cffffff00"
		else
			text = ""
		end
		if(GetInventoryItemTexture("player", ammoSlot) == nil) then
			text = "|cffff0000".."No ammo"
		else
			text = text .. tostring(currentAmmo)
		end
	end

	weaponMainFrame = _G['WIIIUI_weaponIcon_'..frameNumber]
	weaponIconFrame = _G['Wc3_UI_weaponIcon_frame_'..frameNumber]
	weaponIcon = _G['Wc3_UI_weaponIcon_tex_'..frameNumber]
	weaponDamageText = _G['WIIIUI_weaponDamage_'..frameNumber]
	weaponNumbersText = _G['WIIIUI_weaponNumbers_'..frameNumber]

	if(frameNumber == 1)then
		alignerX = 0
		alignerY = 0
		weaponIconSelected = wc3UI_Options.weaponIconSelected1
	elseif(frameNumber == 2)then
		alignerX = wc3UI_Options.uiScale * 0.3607
		alignerY = 0
		weaponIconSelected = wc3UI_Options.weaponIconSelected2
	elseif(frameNumber == 3)then
		alignerX = wc3UI_Options.uiScale * 0.3607
		alignerY = wc3UI_Options.uiScale * -0.1412
		weaponIconSelected = wc3UI_Options.weaponIconSelected3
	end

	weaponFrameScaling = (xpBarLeft:GetWidth() + xpBarMiddle:GetWidth() + xpBarRight:GetWidth())*0.17
	weaponIconFrame:SetWidth( weaponFrameScaling )
	weaponIconFrame:SetHeight(weaponFrameScaling )
	weaponIconFrame:SetPoint("BOTTOMLEFT", xpBarLeft, "BOTTOMLEFT", 1 + alignerX, wc3UI_Options.uiScale*-0.14 + alignerY)
	weaponIconFrame:SetFrameLevel(10)
	-- GetInventoryItemTexture
	-- 16 = Mainhand
	-- 17 = Offhand
	-- 18 = ranged slot
	SetWeaponIcon()
	CheckIfInForm()
	weaponIcon:SetPoint("BOTTOMLEFT", weaponIconFrame, "BOTTOMLEFT", 0, 0)
	weaponIcon:SetWidth( weaponFrameScaling )
	weaponIcon:SetHeight(weaponFrameScaling )
	weaponDamageText:SetText("|cffffd100Damage:|r")
	weaponDamageText:SetWidth(100)
	weaponDamageText:SetHeight(15)
	weaponDamageText:SetJustifyH("LEFT")
	weaponDamageText:SetJustifyV("TOP")
	weaponDamageText:SetPoint("BOTTOMLEFT", weaponIconFrame, "TOPLEFT", wc3UI_Options.uiScale * 0.1294, wc3UI_Options.uiScale*-0.065)

	if(weaponIconSelected == 16)then
		lowDmg, highDmg, offLowDmg, offHiDmg, posBuff, negBuff, percentMod = UnitDamage("player")
		text = floor(lowDmg).." - "..ceil(highDmg)
	elseif(weaponIconSelected == 17) then

		value, isShield = GetBlockValue()

		if(isShield)then
			weaponDamageText:SetText("|cffffd100Block:|r")
			blockChance = string.format("%.1f%%", GetBlockChance())
			text = blockChance.."\n (".. value..")"
		else
			lowDmg, highDmg, offLowDmg, offHiDmg, posBuff, negBuff, percentMod = UnitDamage("player")
			if(GetInventoryItemTexture("player", 17) == nil)then
				text = "N/A"
			else
				text = floor(offLowDmg).." - "..ceil(offHiDmg)
			end
		end

	elseif(weaponIconSelected == 18) then
		speed, lowDmg, highDmg, posBuff, negBuff, percent = UnitRangedDamage("player");
		if(GetInventoryItemTexture("player", 18) == nil)then
			text = "N/A"
		else
			text = floor(lowDmg).." - "..ceil(highDmg)
		end

	-- 98 is heal
	elseif(weaponIconSelected == 98) then
		sp = GetSpellpowerValue()
		hp = GetHealingpowerValue()
		text = (hp + sp)
		weaponDamageText:SetText("|cffffd100Healing:|r")
		
		-- 99 is spell power
	elseif(weaponIconSelected == 99)then
		text = GetSpellpowerValue()
		weaponDamageText:SetText("|cffffd100Spell:|r")

	elseif(weaponIconSelected == 0)then

		UpdateAmmo()
	end

	-- If damage numbers are to high we split up the rows
	if(text ~= nil)then
		if(string.len(text) >= 10 and isShield ~= true and weaponIconSelected ~= 0)then
			if(weaponIconSelected == 16 or weaponIconSelected == 17 or weaponIconSelected == 18)then
				text = floor(lowDmg).." -\n "..ceil(highDmg)
				weaponNumbersText:SetText( text )
			end
		else
			weaponNumbersText:SetText( text )
		end
	end

	weaponNumbersText:SetWidth(100)
	weaponNumbersText:SetHeight(30)
	weaponNumbersText:SetJustifyH("LEFT")
	weaponNumbersText:SetJustifyV("TOP")
	if(wc3UI_Options.uiScale <= 250)then
		extraSpace = 1
	else
		extraSpace = 0
	end
	weaponNumbersText:SetPoint("BOTTOMLEFT", weaponIconFrame, "TOPLEFT", wc3UI_Options.uiScale * 0.1294, (wc3UI_Options.uiScale * -0.1667) - extraSpace + (wc3UI_Options.uiScale <= 210 and -3 or 0))

	weaponMainFrame:SetScript("OnEvent", function()

		if(event == "UPDATE_SHAPESHIFT_FORM" or event == "LEARNED_SPELL_IN_TAB" or event == "SPELLS_CHANGED" or event == "CHARACTER_POINTS_CHANGED" ) then -- I don't remember why I have this here to begin with :(
			AlignWeaponFrame(frameNumber)
		elseif(event == "UNIT_ATTACK_POWER" or event == "UNIT_RANGED_ATTACK_POWER" or event == "UNIT_INVENTORY_CHANGED"or event == "UNIT_AURA") then
			if(arg1 == "player")then
				AlignWeaponFrame(frameNumber)

				-- Update the ammo count
				if(event == "UNIT_INVENTORY_CHANGED")then
					
					if(weaponIconSelected == 0)then

						UpdateAmmo()
						time = 0
						weaponMainFrame:SetScript("OnUpdate", function()
							time = time + arg1
						
							if(time > 2)then
								UpdateAmmo()
								weaponMainFrame:SetScript("OnUpdate", nil)
							end
						end)
					end
				end
			end
		end

	end)
	weaponMainFrame:RegisterEvent("UPDATE_SHAPESHIFT_FORM")
	weaponMainFrame:RegisterEvent("UNIT_RANGED_ATTACK_POWER")
	weaponMainFrame:RegisterEvent("UNIT_ATTACK_POWER")
	weaponMainFrame:RegisterEvent("UNIT_INVENTORY_CHANGED")
	weaponMainFrame:RegisterEvent("LEARNED_SPELL_IN_TAB")
	weaponMainFrame:RegisterEvent("SPELLS_CHANGED")
	weaponMainFrame:RegisterEvent("CHARACTER_POINTS_CHANGED")
	weaponMainFrame:RegisterEvent("UNIT_AURA")
		
end

function AlignArmorFrame()

	local armorFrameScaling
	local base, effectiveArmor, armor, posBuff, negBuff
	local dr
	local isInForm

	armorFrameScaling = (xpBarLeft:GetWidth() + xpBarMiddle:GetWidth() + xpBarRight:GetWidth())*0.17
	armorIconFrame:SetWidth( armorFrameScaling )
	armorIconFrame:SetHeight(armorFrameScaling )
	armorIconFrame:SetPoint("BOTTOMLEFT", xpBarLeft, "BOTTOMLEFT", 1, wc3UI_Options.uiScale*-0.280)
	armorIconFrame:SetFrameLevel(10)
	-- GetInventoryItemTexture
	-- 16 = Mainhand
	-- 17 = Offhand
	-- 18 = ranged slot
	SetArmorIcon(iconArmor)

	armorIcon:SetPoint("BOTTOMLEFT", armorIconFrame, "BOTTOMLEFT", 0, 0)
	armorIcon:SetWidth( armorFrameScaling )
	armorIcon:SetHeight(armorFrameScaling )

	armorText:SetText("|cffffd100Armor:|r")
	armorText:SetWidth(100)
	armorText:SetHeight(15)
	armorText:SetJustifyH("LEFT")
	armorText:SetJustifyV("TOP")
	armorText:SetPoint("BOTTOMLEFT", armorIconFrame, "TOPLEFT", wc3UI_Options.uiScale*0.14, wc3UI_Options.uiScale*-0.065)
	base, effectiveArmor, armor, posBuff, negBuff = UnitArmor("player");
	if( UnitLevel("player") < 60 ) then
		dr = effectiveArmor / (effectiveArmor + 400 + 85 * UnitLevel("player"))
	else
		dr = effectiveArmor / (effectiveArmor + 400 + 85 * (UnitLevel("player") + 4.5 * (59 - 59)))
	end
	dr = string.format("%.1f%%", dr * 100)

	armorValue:SetText( dr )
	armorValue:SetWidth(100)
	armorValue:SetHeight(15)
	armorValue:SetJustifyH("LEFT")
	armorValue:SetJustifyV("TOP")
	--armorValue:SetPoint("BOTTOMLEFT", armorIconFrame, "TOPLEFT", wc3UI_Options.uiScale*0.14, wc3UI_Options.uiScale * -0.1111111111111) 
	armorValue:SetPoint("BOTTOMLEFT", armorIconFrame, "TOPLEFT", wc3UI_Options.uiScale*0.14, wc3UI_Options.uiScale * -0.1111111111111 + (wc3UI_Options.uiScale <= 210 and -3 or 0)) 
	--armorValue:SetFont("Interface\\AddOns\\WIIIUI\\art\\other\\fonts\\blq55.TTF", 10, "")
	
	armorMainFrame:SetScript("OnEvent", function()

		if(arg1 == "player")then

			if(event == "UNIT_RESISTANCES" or event == "UNIT_INVENTORY_CHANGED") then

				base, effectiveArmor, armor, posBuff, negBuff = UnitArmor("player");
				if( UnitLevel("player") < 60 ) then
					dr = effectiveArmor / (effectiveArmor + 400 + 85 * UnitLevel("player"))
				else
					-- Saved for future references, doesn't calculate correctly but the one below this one does.
					--dr = effectiveArmor / (effectiveArmor + 400 + 85 * (UnitLevel("player") + 4.5 * (UnitLevel("player") - 59)))
					dr = effectiveArmor / (effectiveArmor + 400 + 85 * (UnitLevel("player") + 4.5 * (59 - 59)))
				end
				dr = string.format("%.1f%%", dr * 100)
				armorValue:SetText( dr )
	
				SetArmorIcon()
	
			elseif( event == "UNIT_AURA") then
				
				isInForm = CheckIfInForm()
				if(isInForm == false)then
					SetWeaponIcon()
					SetArmorIcon()
				end
			end
		end

	end)
	armorMainFrame:RegisterEvent("UNIT_RESISTANCES")
	armorMainFrame:RegisterEvent("UNIT_INVENTORY_CHANGED")
	armorMainFrame:RegisterEvent("UNIT_AURA")
end

function HideMainMenuBarComponents()

	MainMenuBarOverlayFrame:Hide()
	MainMenuBarOverlayFrame:SetScript("OnLoad", nil)
	
	MainMenuBarPerformanceBarFrameButton:Hide()

	MainMenuBarTexture0:Hide()
	MainMenuBarTexture1:Hide()
	MainMenuBarTexture2:Hide()
	MainMenuBarTexture3:Hide()

	MainMenuBarLeftEndCap:Hide()
	MainMenuBarRightEndCap:Hide()
	MainMenuBarPageNumber:Hide()

	MainMenuExpBar:Hide()
	MainMenuBarMaxLevelBar:Hide()
	MainMenuBarMaxLevelBar:SetScript("OnShow", function()
		MainMenuBarMaxLevelBar:Hide()
	end)
	ExhaustionTick:Hide()

	ExhaustionTick:SetScript("OnShow", function()
		ExhaustionTick:Hide()
	end)

	MainMenuXPBarTexture0:SetTexture('')
	MainMenuXPBarTexture1:SetTexture('')
	MainMenuXPBarTexture2:SetTexture('')
	MainMenuXPBarTexture3:SetTexture('')
	--MainMenuBarArtFrame:Hide()

	MainMenuExpBar:SetScript("OnShow", function()
		MainMenuExpBar:Hide()
	end)

	ActionBarUpButton:Hide()
	ActionBarDownButton:Hide()

	BonusActionBarTexture0:Hide()
	BonusActionBarTexture1:Hide()
end

local function AlignActionBars()
	
	function AlignActionSlot(buttonName, number, extraY)
		
		local previousAB
		local actionButtonNormalTexture, ActionButton_Cooldown, actionButtonIcon
		local hsCD_Center, hsMain_Center, offsetPixels, zoomInPixels

		-- Pixel perfect spacing
		
		if(number == 2)then
			if(wc3UI_Options.uiScale <= 245)then
				-- Not needed.
			else
				if(wc3UI_Options.theme == "human")then
					--extraSpacing = extraSpacing + 1
				end
				extraSpacing = extraSpacing + 0
			end

		elseif(number == 3)then
			if(wc3UI_Options.theme == "human")then
				--extraSpacing = extraSpacing - 1
			end

		elseif(number == 4)then
			extraSpacing = extraSpacing - 3
		elseif(number == 5)then
			extraSpacing = extraSpacing + 2

		elseif(number == 7 )then
			if(wc3UI_Options.uiScale == 260) then
				--spacing = spacing - 1
			end
		elseif(number == 10 )then
			extraSpacing = extraSpacing + 1
		elseif(number == 12)then
			if(wc3UI_Options.uiScale >= 240 and wc3UI_Options.uiScale <= 260 ) then
				extraSpacing = extraSpacing + 1
				if(wc3UI_Options.theme == "human")then
					--extraSpacing = extraSpacing - 2
				end
			elseif(wc3UI_Options.uiScale >= 260 and wc3UI_Options.uiScale <= 270 ) then
				
			end
		end

		if(actionButton ~= nil)then
			previousAB = actionButton
		else
			previousAB = MainMenuBarArtFrame
		end

		actionButton = _G[buttonName..number]
		actionButton:ClearAllPoints()
		if(number == 1)then
			actionButton:SetPoint("BOTTOMLEFT", MainMenuBarArtFrame, "BOTTOMLEFT", -6, extraY)
		else
			actionButton:SetPoint("BOTTOMLEFT", previousAB, "BOTTOMLEFT", (spacing)+extraSpacing, 0)
		end
		
		actionButton:SetWidth(size)
		actionButton:SetHeight(size)
		-- UI design thingy

		-- Normal texture 
		actionButtonNormalTexture = _G[buttonName..number..'NormalTexture']
		actionButtonNormalTexture:SetWidth(size + extraSize)
		actionButtonNormalTexture:SetHeight(size + extraSize)

		-- Cooldown
		ActionButton_Cooldown = _G[buttonName..number..'Cooldown']
		-- We calculate to put the cooldown frame on the center position of customActionButton
		hsCD_Center = ActionButton_Cooldown:GetWidth()/2
		hsMain_Center = actionButton:GetWidth()/2
		offsetPixels = (hsCD_Center - hsMain_Center) / GetScreenWidth()
		ActionButton_Cooldown:SetPosition( -offsetPixels, -offsetPixels, 0 );

		-- Hide icon frames
		if(hideActionFrame) then
			actionButtonNormalTexture:SetWidth(-1)
			actionButtonNormalTexture:SetHeight(-1)
			--Zoom in
			actionButtonIcon = _G[buttonName..number..'Icon']
			zoomInPixels = wc3UI_Options.uiScale*0.01851
			zoomInPixels = (zoomInPixels/actionButtonIcon:GetWidth())
			actionButtonIcon:SetTexCoord(zoomInPixels, 1-zoomInPixels, zoomInPixels, 1-zoomInPixels);
		end

		-- Resize the icon
		actionButton:SetScript("OnDragStop", function()
			dummyFrame:SetScript("OnUpdate", function()
				if(arg1 > 0)then
					AlignActionBars()
					dummyFrame:SetScript("OnUpdate", nil)
				end
			end)
		end)
	end

	local parentFrame
	local counter
	local extraY

	hideActionFrame = true
	parentFrame = MainMenuBar
	parentFrame:SetPoint("BOTTOMLEFT", actionSlotGridMain, "BOTTOMLEFT", wc3UI_Options.uiScale*0.037037, -1)
	
	yPos = wc3UI_Options.uiScale * 0.07037
	size = wc3UI_Options.uiScale*0.11111
	extraSize = size*0.7667
	spacing = wc3UI_Options.uiScale*0.159259
	extraSpacing = 0
	
	-- Bottom row
	counter = 1
	for actionButtonNumber = 1, 12, 1 do
		-- This is a fix so the BonusActionBar does not show itself when it shouldnt
		if(counter == 2)then
			-- The first ActionButton must be a parent of MainMenuBarArtFrame, otherwise it starts to bug out.
			-- We do a ClearAllPoints() and re-attach it to MainMenuBarArtFrame. Now we can move it and the bug is fixed.
			actionButton:SetPoint("BOTTOMLEFT", MainMenuBarArtFrame, "BOTTOMLEFT", -6, 5)
		end
		counter = counter + 1
		AlignActionSlot("ActionButton", actionButtonNumber, 0)
	end

	-- Multi bar left
	extraSpacing = 0
	extraY = actionButton:GetHeight() + wc3UI_Options.uiScale*0.0667
	for actionButtonNumber = 1, 12, 1 do
		AlignActionSlot("MultiBarBottomLeftButton", actionButtonNumber, extraY)
	end

	-- Multi bar right
	extraSpacing = 0
	extraY = extraY + actionButton:GetHeight() + wc3UI_Options.uiScale*0.04444
	for actionButtonNumber = 1, 12, 1 do
		AlignActionSlot("MultiBarBottomRightButton", actionButtonNumber, extraY)
	end

	-- Bonus action bar 
	extraSpacing = 0
	parentFrame = BonusActionBarFrame
	for actionButtonNumber = 1, 12, 1 do
		AlignActionSlot("BonusActionButton", actionButtonNumber, 5)
	end
end

function AlignCastBar()
	
	local cBarPos

	cBarPos = wc3UI_Options.castbarAlignmentOption / 270
	cBarPos = wc3UI_Options.uiScale * cBarPos
	CastingBarFrame:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, cBarPos)
	CastingBarFrame:SetScript("OnShow", function(self)
		
		-- force position, possible fix against blizzard's own setpoint
		this:ClearAllPoints()
		this:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, cBarPos)
	end)
end

function AlignActionBarUIGrid()

	local size

	size = wc3UI_Options.uiScale * 0.91851
	actionSlotGridMain:SetWidth(size)
	actionSlotGridMain:SetHeight(size)
	actionSlotGridMain:SetPoint("BOTTOMLEFT", extensionBackground, "BOTTOMLEFT", wc3UI_Options.uiScale*0.2 - wc3UI_Options.uiScale*0.01666666667, 1)
	
	actionSlotGrid_1:SetWidth(actionSlotGridMain:GetWidth())
	actionSlotGrid_1:SetHeight(actionSlotGridMain:GetHeight())

	actionSlotGrid_2:SetWidth(actionSlotGridMain:GetWidth())
	actionSlotGrid_2:SetHeight(actionSlotGridMain:GetHeight())
	actionSlotGrid_2:SetPoint("BOTTOMLEFT", actionSlotGrid_1, "BOTTOMRIGHT", wc3UI_Options.uiScale*-0.4518, 0)
	
	actionSlotGrid_3:SetWidth(actionSlotGridMain:GetWidth())
	actionSlotGrid_3:SetHeight(actionSlotGridMain:GetHeight())
	actionSlotGrid_3:SetPoint("BOTTOMLEFT", actionSlotGrid_2, "BOTTOMRIGHT", wc3UI_Options.uiScale*-0.4518, 0)

	actionSlotGrid_4:SetWidth(actionSlotGridMain:GetWidth())
	actionSlotGrid_4:SetHeight(actionSlotGridMain:GetHeight())
	actionSlotGrid_4:SetPoint("BOTTOMLEFT", actionSlotGrid_3, "BOTTOMRIGHT", wc3UI_Options.uiScale*-0.6115 + 2, 0)

	PetActionBarFrame:Hide()
	PetActionBarFrame:SetScript("OnShow", function() 
		PetActionBarFrame:Hide()
	end)

	if(wc3UI_Options.hideGride)then

		if(wc3UI_Options.theme == "nightelf")then
			Wc3_UI_extension1:SetParent("WIIIUI_leftpart")
			Wc3_UI_extension2:SetParent("WIIIUI_leftpart")
			Wc3_UI_extension3:SetParent("WIIIUI_leftpart")
		end

		actionSlotGridMain:Hide()
	else
		actionSlotGridMain:Show()

		if(wc3UI_Options.theme == "nightelf")then
			Wc3_UI_extension1:SetParent("WIIIUI_actionslotGrid")
			Wc3_UI_extension2:SetParent("WIIIUI_actionslotGrid")
			Wc3_UI_extension3:SetParent("WIIIUI_actionslotGrid")
		end
	end
end

function AlignMiddleExtension()

	extension1:ClearAllPoints()
	extension1:SetWidth(wc3UI_Options.uiScale)
	extension1:SetHeight(wc3UI_Options.uiScale * 0.12592)
	extension1:SetPoint("BOTTOMLEFT", portraitFrame, "BOTTOMRIGHT", wc3UI_Options.uiScale*-0.15, wc3UI_Options.uiScale*0.45)

	--extension2:ClearAllPoints()
	extension2:SetWidth(wc3UI_Options.uiScale)
	extension2:SetHeight(wc3UI_Options.uiScale * 0.12592)
	extension2:SetPoint("BOTTOMLEFT", extension1, "BOTTOMRIGHT", wc3UI_Options.uiScale*-0.05, 0)
	extension2:Hide()

	extension3:ClearAllPoints()
	extension3:SetWidth(wc3UI_Options.uiScale * 0.9481)
	extension3:SetHeight(wc3UI_Options.uiScale * 0.12592)

	if(wc3UI_Options.theme == "human")then
		extension3:SetWidth( 144 )
		extension3:SetHeight( 144/4 )
	end


	if(wc3UI_Options.uiScale >= 260 )then
		extension2:Show()
		extension2:SetPoint("BOTTOMLEFT", extension1, "BOTTOMRIGHT", wc3UI_Options.uiScale*-0.17, 0)
		extension3:SetPoint("BOTTOMLEFT", extension1, "BOTTOMRIGHT", wc3UI_Options.uiScale*0.15, wc3UI_Options.uiScale*0.013)

	elseif( wc3UI_Options.uiScale < 260) then
		extension2:Show()
		extension2:SetPoint("BOTTOMLEFT", extension1, "BOTTOMRIGHT", wc3UI_Options.uiScale*-0.05, 0)
		if(wc3UI_Options.uiScale >= 240)then
			extension2:SetPoint("BOTTOMLEFT", extension1, "BOTTOMRIGHT", wc3UI_Options.uiScale*-0.40, 0)
			extension3:SetPoint("BOTTOMLEFT", extension2, "BOTTOMRIGHT", wc3UI_Options.uiScale*-0.50, wc3UI_Options.uiScale*0.013)
		elseif(wc3UI_Options.uiScale >= 250) then
			extension3:SetPoint("BOTTOMLEFT", extension2, "BOTTOMRIGHT", wc3UI_Options.uiScale*-0.50, wc3UI_Options.uiScale*0.013)
		else	
			extension3:SetPoint("BOTTOMLEFT", extension2, "BOTTOMRIGHT", wc3UI_Options.uiScale*-0.55, wc3UI_Options.uiScale*0.013)
		end
		
	end

	-- Human UI alignments etc
	if(wc3UI_Options.theme == "human")then

		extension2:SetTexCoord(0.265625, 1, 0 ,1)
		extension2:SetWidth(wc3UI_Options.uiScale*0.8148148)
		extension2:SetPoint("BOTTOMLEFT", extension1, "BOTTOMRIGHT", 0, 0)

		extension3:SetPoint("BOTTOMLEFT", extension1, "BOTTOMRIGHT", wc3UI_Options.uiScale*0.73333, wc3UI_Options.uiScale*0.01481481)
		extension3:SetWidth( wc3UI_Options.uiScale*0.26667 )
		extension3:SetHeight( wc3UI_Options.uiScale*0.13333334 )
		extension3:SetTexCoord(0.5 ,1, 0, 1)
	else
		extension2:SetTexCoord(0.0, 1, 0 ,1)
		extension3:SetTexCoord(0.0 ,1, 0, 1)
	end

	extensionBackground:ClearAllPoints()
	extensionBackground:SetWidth(wc3UI_Options.uiScale*2.1)
	extensionBackground:SetHeight(wc3UI_Options.uiScale*0.5)
	extensionBackground:SetPoint("BOTTOMLEFT", "Wc3_UI_portrait", "BOTTOMRIGHT", wc3UI_Options.uiScale*-0.18, 0)

end

function AlignInventorySlots()
	WIIIUI_inventorySlots:SetParent(rightFrame)
	WIIIUI_inventorySlots:SetPoint("BOTTOMLEFT", rightPart_middle, "BOTTOMLEFT", wc3UI_Options.uiScale*0.02, wc3UI_Options.uiScale*0.016)
end

function InventorySlots()

	local inventoryActionSlot, ActionButton_Cooldown, normalTexture, actionButtonIcon
	local hsCD_Center, hsMain_Center, offsetPixels, zoomInPixels
	local column = 0
	local row = 0

	for inventoryNumber = 1, 6, 1 do

		inventoryActionSlot = _G['ActionButton_CustomInventory_'..inventoryNumber]
		inventoryActionSlot:SetWidth(wc3UI_Options.uiScale*0.1185185) -- 30,81481
		inventoryActionSlot:SetHeight(wc3UI_Options.uiScale*0.1185185)
		inventoryActionSlot:ClearAllPoints()
		inventoryActionSlot:SetPoint( 
			"BOTTOMLEFT",
			WIIIUI_inventorySlots, 
			"CENTER", 
			column* (wc3UI_Options.uiScale*0.156)- (1-column),  
			row*(wc3UI_Options.uiScale*0.148) 
		)
		
		if( math.mod(inventoryNumber, 2) == 1 )then
			
			column = 0
			if(inventoryNumber == 1)then
				column = 1
			end
		else
			column = 1
			row = row + 1
		end

		-- Cooldown
		ActionButton_Cooldown = _G['ActionButton_CustomInventory_'..inventoryNumber..'Cooldown']
		-- We calculate to put the cooldown frame on the center position of customActionButton
		hsCD_Center = ActionButton_Cooldown:GetWidth()/2
		hsMain_Center = inventoryActionSlot:GetWidth()/2
		offsetPixels = (hsCD_Center - hsMain_Center) / GetScreenWidth()
		ActionButton_Cooldown:SetPosition( -offsetPixels, -offsetPixels, 0 );

		-- Hide frame etc
		normalTexture = _G['ActionButton_CustomInventory_'..inventoryNumber.."NormalTexture"]
		normalTexture:SetWidth(-1)
		normalTexture:SetHeight(-1)
		--Zoom in
		actionButtonIcon = _G['ActionButton_CustomInventory_'..inventoryNumber..'Icon']
		zoomInPixels = wc3UI_Options.uiScale * 0.018518
		zoomInPixels = (zoomInPixels/actionButtonIcon:GetWidth())
		actionButtonIcon:SetTexCoord(zoomInPixels, 1-zoomInPixels, zoomInPixels, 1-zoomInPixels);

		-- Resize the icon
		inventoryActionSlot:SetScript("OnDragStop", function()
			dummyFrame:SetScript("OnUpdate", function()
				if(arg1 > 0)then
					InventorySlots()
					dummyFrame:SetScript("OnUpdate", nil)
				end
			end)
		end)

	end
end

function AlignChatFrames()
	ChatFrame1:SetFrameStrata("DIALOG")
	ChatFrame1Tab:SetFrameStrata("DIALOG")
	ChatFrame2:SetFrameStrata("DIALOG")
	ChatFrame2Tab:SetFrameStrata("DIALOG")
	
	if(wc3UI_Options.chatInputAbove) then
		ChatFrameEditBox:SetPoint("TOPLEFT", ChatFrame1Tab, "TOPLEFT", -5, -2)
	else
		ChatFrameEditBox:SetPoint("TOPLEFT", ChatFrame1, "BOTTOMLEFT", -5, -2)
	end
end

function AlignBags()

	-- Lazy implemantion of blizzards container anchor function
	function updateContainerAnchors()
		CONTAINER_WIDTH = 192;
		CONTAINER_SPACING = 0;
		VISIBLE_CONTAINER_SPACING = 3;

		CONTAINER_OFFSET_Y = 263 -- Change this to trigger when a bag is moved to another column
		CONTAINER_OFFSET_X = 0

		CONTAINER_SCALE = 0.75;

		local frame, xOffset, yOffset, screenHeight, freeScreenHeight, leftMostPoint, column;
		local screenWidth = GetScreenWidth();
		local containerScale = 1;
		local leftLimit = 0;
		if ( BankFrame:IsShown() ) then
			leftLimit = BankFrame:GetRight() - 25;
		end
		
		while ( containerScale > CONTAINER_SCALE ) do
			screenHeight = GetScreenHeight() / containerScale;
			-- Adjust the start anchor for bags depending on the multibars
			xOffset = CONTAINER_OFFSET_X / containerScale; 
			yOffset = CONTAINER_OFFSET_Y / containerScale; 
			-- freeScreenHeight determines when to start a new column of bags
			freeScreenHeight = screenHeight - yOffset;
			leftMostPoint = screenWidth - xOffset;
			column = 1;
			local frameHeight;
			for index, frameName in ipairs(ContainerFrame1.bags) do
				frameHeight = getglobal(frameName):GetHeight();
				if ( freeScreenHeight < frameHeight ) then
					-- Start a new column
					column = column + 1;
					leftMostPoint = screenWidth - ( column * CONTAINER_WIDTH * containerScale ) - xOffset;
					freeScreenHeight = screenHeight - yOffset;
				end
				freeScreenHeight = freeScreenHeight - frameHeight - VISIBLE_CONTAINER_SPACING;
			end
			if ( leftMostPoint < leftLimit ) then
				containerScale = containerScale - 0.01;
			else
				break;
			end
		end
		
		if ( containerScale < CONTAINER_SCALE ) then
			containerScale = CONTAINER_SCALE;
		end
		
		screenHeight = GetScreenHeight() / containerScale;
		-- Adjust the start anchor for bags depending on the multibars
		xOffset = CONTAINER_OFFSET_X / containerScale;
		yOffset = CONTAINER_OFFSET_Y / containerScale;
		-- freeScreenHeight determines when to start a new column of bags
		freeScreenHeight = screenHeight - yOffset;
		column = 0;
		for index, frameName in ipairs(ContainerFrame1.bags) do
			frame = getglobal(frameName);
			frame:SetScale(containerScale);
			if ( index == 1 ) then
				-- First bag
				frame:SetPoint("BOTTOMRIGHT", frame:GetParent(), "BOTTOMRIGHT", -xOffset, yOffset );
			elseif ( freeScreenHeight < frame:GetHeight() ) then
				-- Start a new column
				column = column + 1;
				freeScreenHeight = screenHeight - yOffset;
				frame:SetPoint("BOTTOMRIGHT", frame:GetParent(), "BOTTOMRIGHT", -(column * CONTAINER_WIDTH) - xOffset, yOffset );
			else
				-- Anchor to the previous bag
				frame:SetPoint("BOTTOMRIGHT", ContainerFrame1.bags[index - 1], "TOPRIGHT", 0, CONTAINER_SPACING);	
			end
			freeScreenHeight = freeScreenHeight - frame:GetHeight() - VISIBLE_CONTAINER_SPACING;
		end
	end

	StackSplitFrame:SetFrameStrata("DIALOG")
	StackSplitFrame:SetFrameLevel(1250)
	StackSplitLeftButton:SetFrameStrata("DIALOG")
	StackSplitLeftButton:SetFrameLevel(1500)
	StackSplitRightButton:SetFrameStrata("DIALOG")
	StackSplitRightButton:SetFrameLevel(1500)
	StackSplitOkayButton:SetFrameStrata("DIALOG")
	StackSplitOkayButton:SetFrameLevel(1500)
	StackSplitCancelButton:SetFrameStrata("DIALOG")
	StackSplitCancelButton:SetFrameLevel(1500)

	ContainerFrame1:SetFrameStrata("DIALOG")
	ContainerFrame2:SetFrameStrata("DIALOG")
	ContainerFrame3:SetFrameStrata("DIALOG")
	ContainerFrame4:SetFrameStrata("DIALOG")
	ContainerFrame5:SetFrameStrata("DIALOG")

	MainMenuBarBackpackButton:SetParent(UIParent)
	MainMenuBarBackpackButton:SetFrameStrata("DIALOG")
	MainMenuBarBackpackButton:ClearAllPoints()

	CharacterBag0Slot:SetParent(UIParent)
	CharacterBag0Slot:SetFrameStrata("DIALOG")
	CharacterBag0Slot:SetFrameLevel(500)
	CharacterBag0Slot:ClearAllPoints()

	CharacterBag1Slot:SetParent(UIParent)
	CharacterBag1Slot:SetFrameStrata("DIALOG")
	CharacterBag1Slot:ClearAllPoints()

	CharacterBag2Slot:SetParent(UIParent)
	CharacterBag2Slot:SetFrameStrata("DIALOG")
	CharacterBag2Slot:ClearAllPoints()

	CharacterBag3Slot:SetParent(UIParent)
	CharacterBag3Slot:SetFrameStrata("DIALOG")
	CharacterBag3Slot:ClearAllPoints()

	KeyRingButton:SetParent(CharacterBag0Slot)
	KeyRingButton:SetFrameStrata("DIALOG")
	KeyRingButton:ClearAllPoints()

	if(wc3UI_Options.hideBagsAboveChatFrame)then
		MainMenuBarBackpackButton:Hide()
		CharacterBag0Slot:Hide()
		CharacterBag1Slot:Hide()
		CharacterBag2Slot:Hide()
		CharacterBag3Slot:Hide()
		KeyRingButton:Hide()
		--MainMenuBarBackpackButton:SetPoint("TOPRIGHT", bottomRight_Top, "BOTTOMRIGHT", uiScale*-0.2769, 63)
		MainMenuBarBackpackButton:SetScript("OnUpdate", function() 
			MainMenuBarBackpackButton:SetPoint("TOPRIGHT", bottomRight_Top, "BOTTOMRIGHT", wc3UI_Options.uiScale*-0.2769, 63)
			if(wc3UI_Options.theme == "nightelf")then
				MainMenuBarBackpackButton:SetPoint("TOPRIGHT", bottomRight_Top, "BOTTOMRIGHT", wc3UI_Options.uiScale*-0.192592, 63)
			end
			ContainerFrame1:SetPoint("BOTTOMLEFT", MainMenuBarBackpackButton, "BOTTOMRIGHT", 0, 38)
			MainMenuBarBackpackButton:SetScript("OnUpdate", nil)

		end)
		--MainMenuBarBackpackButton:SetPoint("BOTTOMLEFT", bottomRight_Top, "BOTTOMLEFT", -39, 0)
		CharacterBag0Slot:SetPoint("BOTTOMLEFT", MainMenuBarBackpackButton, "BOTTOMLEFT", -39, 0)
		CharacterBag1Slot:SetPoint("BOTTOMLEFT", CharacterBag0Slot, "BOTTOMLEFT", -39, 0)
		CharacterBag2Slot:SetPoint("BOTTOMLEFT", CharacterBag1Slot, "BOTTOMLEFT", -39, 0)
		CharacterBag3Slot:SetPoint("BOTTOMLEFT", CharacterBag2Slot, "BOTTOMLEFT", -39, 0)
		KeyRingButton:SetPoint("BOTTOMLEFT", CharacterBag3Slot, "BOTTOMLEFT", -20, -1)
	else

		MainMenuBarBackpackButton:SetScript("OnUpdate", function() 
			MainMenuBarBackpackButton:SetPoint("TOPRIGHT", bottomRight_Top, "BOTTOMRIGHT", wc3UI_Options.uiScale*-0.2769, 63)
			if(wc3UI_Options.theme == "nightelf")then
				MainMenuBarBackpackButton:SetPoint("TOPRIGHT", bottomRight_Top, "BOTTOMRIGHT", wc3UI_Options.uiScale*-0.192592, 63)
			end
			MainMenuBarBackpackButton:SetScript("OnUpdate", nil)
		end)
		CharacterBag0Slot:SetPoint("BOTTOMLEFT", MainMenuBarBackpackButton, "BOTTOMLEFT", -39, 0)
		CharacterBag1Slot:SetPoint("BOTTOMLEFT", CharacterBag0Slot, "BOTTOMLEFT", -39, 0)
		CharacterBag2Slot:SetPoint("BOTTOMLEFT", CharacterBag1Slot, "BOTTOMLEFT", -39, 0)
		CharacterBag3Slot:SetPoint("BOTTOMLEFT", CharacterBag2Slot, "BOTTOMLEFT", -39, 0)
		KeyRingButton:SetPoint("BOTTOMLEFT", CharacterBag3Slot, "BOTTOMLEFT", -20, -1)
		ContainerFrame1:SetPoint("BOTTOMLEFT", MainMenuBarBackpackButton, "BOTTOMRIGHT", 0, 38)

		MainMenuBarBackpackButton:SetFrameStrata("LOW")
		CharacterBag0Slot:SetFrameStrata("LOW")
		CharacterBag1Slot:SetFrameStrata("LOW")
		CharacterBag2Slot:SetFrameStrata("LOW")
		CharacterBag3Slot:SetFrameStrata("LOW")
		KeyRingButton:SetFrameStrata("LOW")

		MainMenuBarBackpackButton:Show()
		CharacterBag0Slot:Show()
		CharacterBag1Slot:Show()
		CharacterBag2Slot:Show()
		CharacterBag3Slot:Show()
		KeyRingButton:Show()
	end

	ContainerFrame1Item1:SetScript("OnShow", function()
		MainMenuBarBackpackButton:Show()
		CharacterBag0Slot:Show()
		CharacterBag1Slot:Show()
		CharacterBag2Slot:Show()
		CharacterBag3Slot:Show()
		KeyRingButton:Show()
		updateContainerAnchors()
	end)
	ContainerFrame1Item1:SetScript("OnHide", function()
		if(wc3UI_Options.hideBagsAboveChatFrame)then
			MainMenuBarBackpackButton:Hide()
			CharacterBag0Slot:Hide()
			CharacterBag1Slot:Hide()
			CharacterBag2Slot:Hide()
			CharacterBag3Slot:Hide()
			KeyRingButton:Hide()
		end

	end)
end

function AlignMicroButtons()

	local moveY, moveX
	local skip
	local talentTime

	microButtons = {	
		'HelpMicroButton',
		'MainMenuMicroButton',
		'WorldMapMicroButton',
		'SocialsMicroButton',
		'QuestLogMicroButton',
		'TalentMicroButton',
		'SpellbookMicroButton',
		'CharacterMicroButton',
	}

	moveY = 0
	if(wc3UI_Options.uiScale < 245)then
		moveX = -3
	elseif(wc3UI_Options.uiScale < 253)then
		moveX = -4
	elseif(wc3UI_Options.uiScale < 260)then
		moveX = -6
	elseif(wc3UI_Options.uiScale < 264)then
		moveX = -8
	else
		moveX = -8
	end

	if(wc3UI_Options.theme == "human")then
		moveX = -8
	elseif(wc3UI_Options.theme == "undead")then
		moveX = -5
		moveY = 7
	elseif(wc3UI_Options.theme == "nightelf")then
		moveX = -12
		moveY = 11
	end

	skip = 0
	for i=0, 7, 1 do
		microButton = _G[microButtons[i+1]]
		
		if(UnitLevel("player") < 10 and microButton:GetName() == "TalentMicroButton" ) then
			talentTime = 0
			TalentMicroButton:SetScript("OnUpdate", function()
				
				talentTime = talentTime + arg1
				if(wc3UI_Options.hideMicroButtons)then
					TalentMicroButton:Hide()
				else
					TalentMicroButton:Show()
				end

				if(arg1 > 2)then
					TalentMicroButton:SetScript("OnUpdate", nil)
				end
			end)
			
			skip = 1
		end
			
		microButton:SetParent(UIParent)
		microButton:ClearAllPoints()
		microButton:SetPoint("BOTTOMLEFT", actionSlotGrid_4, "TOPRIGHT", -27*(i - skip) + (moveX), wc3UI_Options.uiScale*-0.3916 + moveY)
		if(wc3UI_Options.hideMicroButtons)then
			microButton:Hide()
			microButton.Show = function() end
		else
			if(microButton:IsVisible() == nil and i == 1)then
				ChatFrame1:AddMessage("|cffff0000WIIIUI WARNING - PLEASE RELOAD UI TO DISPLAY MICROBUTTONS AGAIN")
			end
			microButton:Show()
		end
	end

end

function AlignPetFrames()

	local hasActionBar
	local petActionSlot, petDebuffFrame	
	local extraSpace

	hasActionBar = PetHasActionBar()

	if(hasActionBar == nil)then
		return
	end

	PetFrame:SetParent(UIParent)
	PetFrame:Show()
	PetFrame:ClearAllPoints()
	PetFrame:SetPoint("BOTTOMLEFT", PortraitCustom, "BOTTOMLEFT", -50, wc3UI_Options.uiScale*0.5625)
	if(wc3UI_Options.theme == "human")then
		PetFrame:SetPoint("BOTTOMLEFT", PortraitCustom, "BOTTOMLEFT", -58, wc3UI_Options.uiScale*0.5625)
	elseif(wc3UI_Options.theme == "undead")then
		PetFrame:SetPoint("BOTTOMLEFT", PortraitCustom, "BOTTOMLEFT", -42, wc3UI_Options.uiScale*0.5625 + wc3UI_Options.uiScale*0.0185185)
	elseif(wc3UI_Options.theme == "nightelf")then
		PetFrame:SetPoint("BOTTOMLEFT", PortraitCustom, "BOTTOMLEFT", -40, wc3UI_Options.uiScale*0.5625)
	end

	for i=0, 9, 1 do
		petActionSlot = _G['PetActionButton'..(i+1)]
		petActionSlot:SetParent(UIParent)
		petActionSlot:Show()
		petActionSlot:ClearAllPoints()
		petActionSlot:SetPoint("BOTTOMLEFT", PetFrame, "BOTTOMLEFT", (35*i) + 45, -25)
	end

	if(PetFrameHappiness:IsVisible())then
		extraSpace = 20
	else
		extraSpace = -7
	end

	for i=0, 3, 1 do
		petDebuffFrame = _G['PetFrameDebuff'..(i+1)]
		petDebuffFrame:SetParent(PetFrame)
		petDebuffFrame:ClearAllPoints()
		petDebuffFrame:SetPoint("BOTTOMLEFT", PetFrame, "BOTTOMRIGHT", (19*i) + extraSpace, 15)
	end
end

function EnableChatScroll()

	local chatFrame

	for i=1, 20, 1 do
		chatFrame = _G['ChatFrame'..i]
		if(chatFrame ~= nil)then

			chatFrameTab = _G['ChatFrame'..i.."Tab"]
			chatFrameTab:SetFrameStrata("DIALOG")
			chatFrame:SetFrameStrata("DIALOG")

			chatFrame:EnableMouseWheel(1)
			chatFrame:SetScript("OnMouseWheel", function()
				if(arg1 == 1)then
					this:ScrollUp()
				else
					this:ScrollDown()
				end
			end)

		else
			break;
		end
	end
end

function AlignShapeshiftButtons()

	local alignX
	local count
	local button
	local buttonBorder, buttonNormal
	local shapeshiftPosOption
	local themeAlignerX, themeAlignerY

	ShapeshiftBarFrame:SetParent(UIParent)
	ShapeshiftBarFrame:Show()
	ShapeshiftBarFrame:SetFrameStrata("BACKGROUND")

	ShapeshiftBarLeft:Hide()
	ShapeshiftBarMiddle:Hide()
	ShapeshiftBarRight:Hide()

	alignX = 0
	count = 0
	for i=0, 10, 1 do
		button = _G['ShapeshiftButton'..i+1]

		if(i+1 == 1)then
			button:SetPoint("BOTTOMLEFT", ShapeshiftBarFrame, "BOTTOMLEFT", 10, 3)
		else
			button:SetPoint("LEFT", _G['ShapeshiftButton'..i], "RIGHT", 1, 0)
		end

		buttonBorder = _G['ShapeshiftButton'..(i+1) ..'Border']
		buttonNormal = _G['ShapeshiftButton'..(i+1) ..'NormalTexture']
		buttonNormal:SetWidth(51)
		buttonNormal:SetHeight(51)

		if(button == nil or button:IsVisible() == nil)then
			break
		end

		count = count + 1
		alignX = alignX + button:GetWidth()
		
	end
	alignX = (alignX / 2) + 13
	if(count == 1)then
		alignX = -2
	end

	shapeshiftPosOption = wc3UI_Options.shapeshiftAuraPos
	if(shapeshiftPosOption == 1) then
		
		if(Minimap:IsVisible())then
			ShapeshiftBarFrame:SetPoint("BOTTOMLEFT", Minimap, "TOPLEFT", wc3UI_Options.uiScale*-0.057692, wc3UI_Options.uiScale*0.080769)
		else
			ShapeshiftBarFrame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", wc3UI_Options.uiScale*-0.02592, wc3UI_Options.uiScale*0.65555)
		end

	elseif(shapeshiftPosOption == 2) then

		themeAlignerX = 0
		themeAlignerY = 0
		if(wc3UI_Options.theme == "human")then
			themeAlignerX = wc3UI_Options.uiScale*0.046153846
			themeAlignerY = -wc3UI_Options.uiScale*0.003846153
		elseif(wc3UI_Options.theme == "undead")then
			themeAlignerX = -wc3UI_Options.uiScale*0.0192307 
			themeAlignerY = -wc3UI_Options.uiScale*0.0115384
		elseif(wc3UI_Options.theme == "nightelf")then
			themeAlignerX = -wc3UI_Options.uiScale*0.0192307
		end
		if(CustomPlayerModelPortrait:IsVisible())then
			ShapeshiftBarFrame:SetPoint("BOTTOMLEFT", CustomPlayerModelPortrait, "TOPLEFT", -wc3UI_Options.uiScale*0.05 - themeAlignerX, wc3UI_Options.uiScale*0.16730769 - themeAlignerY)
		else
			ShapeshiftBarFrame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", wc3UI_Options.uiScale*0.8037 - themeAlignerX, wc3UI_Options.uiScale*0.5377 - themeAlignerY)
		end

	elseif(shapeshiftPosOption == 3) then
		
		local width = _G['ShapeshiftButton'..count]:GetRight() - _G['ShapeshiftButton1']:GetLeft()
		ShapeshiftBarFrame:ClearAllPoints()
		ShapeshiftBarFrame:SetPoint("BOTTOM", WIIIUI_xpHoverFrame, "TOP", -width/2, wc3UI_Options.uiScale*0.1461538)

	elseif(shapeshiftPosOption == 4) then
		
		local shapeshift_size = _G['ShapeshiftButton'..count]:GetRight() - _G['ShapeshiftButton1']:GetLeft()

		ShapeshiftBarFrame:SetWidth(shapeshift_size)
		ShapeshiftBarFrame:ClearAllPoints()
		if(count == 1)then
			ShapeshiftBarFrame:SetPoint("BOTTOM", UIParent, "BOTTOM", -10, wc3UI_Options.uiScale*0.5407)
		else
			-- its -10 because the parent frame (ShapeshiftBarFrame) is 10 pixels to the left of the first shapeshift button
			ShapeshiftBarFrame:SetPoint("BOTTOM", UIParent, "BOTTOM", -10, wc3UI_Options.uiScale*0.5407)
		end

	elseif(shapeshiftPosOption == 5)then
		ShapeshiftBarFrame:Hide()
	end

	-- Ugly fix
	rightFrame:SetScript("OnEvent", function()
		if(event == "LEARNED_SPELL_IN_TAB" or event == "SPELLS_CHANGED")then
			AlignShapeshiftButtons()
		end
	end)
	rightFrame:RegisterEvent("LEARNED_SPELL_IN_TAB")
	rightFrame:RegisterEvent("SPELLS_CHANGED")
	
end

function AlignPlayerIcons()
	
	PlayerStatusGlow:SetParent(UIParent)
	PlayerStatusGlow:ClearAllPoints()

	-- Leader icon
	PlayerLeaderIcon:SetParent(UIParent)
	PlayerLeaderIcon:ClearAllPoints()
	PlayerLeaderIcon:SetPoint("BOTTOMLEFT", portraitFrame, "BOTTOMLEFT", wc3UI_Options.uiScale*0.0784313, wc3UI_Options.uiScale*0.368627)
	-- Master loot icon
	PlayerMasterIcon:SetParent(UIParent)
	PlayerMasterIcon:ClearAllPoints()
	PlayerMasterIcon:SetPoint("BOTTOMLEFT", portraitFrame, "BOTTOMLEFT", wc3UI_Options.uiScale*0.0784313, wc3UI_Options.uiScale*0.3137254)
	-- PVP icon
	PlayerPVPIcon:ClearAllPoints()
	PlayerPVPIcon:SetParent(UIParent)
	PlayerPVPIcon:SetPoint("BOTTOMLEFT", portraitFrame, "BOTTOMLEFT", wc3UI_Options.uiScale*-0.2307692, 0)
	PlayerPVPIcon:Show()
	-- Rest icon
	PlayerRestIcon:SetParent(UIParent)
	PlayerRestIcon:ClearAllPoints()
	PlayerRestIcon:SetPoint("BOTTOMLEFT", portraitFrame, "BOTTOMLEFT", wc3UI_Options.uiScale*-0.188235, wc3UI_Options.uiScale*0.32941)
	-- Rest Glow
	PlayerRestGlow:SetParent(UIParent)
	PlayerRestGlow:ClearAllPoints()
	PlayerRestGlow:SetPoint("BOTTOMLEFT", portraitFrame, "BOTTOMLEFT",  wc3UI_Options.uiScale*-0.188235, wc3UI_Options.uiScale*0.32941)
	if(PlayerRestIcon:IsVisible())then
		PlayerRestGlow:Show()
	else
		PlayerRestGlow:Hide()
	end
	-- In combat icon
	PlayerAttackIcon:SetParent(UIParent)
	PlayerAttackIcon:ClearAllPoints()
	PlayerAttackIcon:SetPoint("BOTTOMLEFT", portraitFrame, "BOTTOMLEFT",  wc3UI_Options.uiScale*-0.188235, wc3UI_Options.uiScale*0.32941)
	-- Script events to hide the attack glow, this is a fix.
	dummyGlowFrame = _G['DummyGlowFrame'] or CreateFrame("Frame", "DummyGlowFrame", PlayerStatusGlow, nil)
	dummyGlowFrame:SetScript("OnHide", function()
		PlayerAttackGlow:Hide()
		PlayerRestGlow:Hide()
	end)
	-- Attack glow icon
	PlayerAttackGlow:SetParent(UIParent)
	PlayerAttackGlow:ClearAllPoints()
	PlayerAttackGlow:SetPoint("BOTTOMLEFT", portraitFrame, "BOTTOMLEFT",  wc3UI_Options.uiScale*-0.188235, wc3UI_Options.uiScale*0.32941)
	PlayerAttackGlow:Hide()

end

function MultiBarAxis()

	local multiButton

	if(wc3UI_Options.MultiBarRightHorizontal)then
		MultiBarRight:ClearAllPoints()
		MultiBarRight:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
		for i=1, 12, 1 do
			multiButton = _G['MultiBarRightButton'..i]
			multiButton:ClearAllPoints()
			multiButton:SetPoint("CENTER", MultiBarRight, "CENTER", 43*(i - 1), 0)
		end
	end

	if(wc3UI_Options.MultiBarLeftHorizontal)then
		MultiBarLeft:ClearAllPoints()
		MultiBarLeft:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
		for i=1, 12, 1 do
			multiButton = _G['MultiBarLeftButton'..i]
			multiButton:ClearAllPoints()
			multiButton:SetPoint("CENTER", MultiBarLeft, "CENTER", 43*(i - 1), 0)
		end
	end

end

function AlignRightPart()

	local extraX, extraHeight
	local shiftWidth
	local offset, offset2
	local alignExtraHorizontal, alignExtraHorizontal2
	local offsetExtension1
	local extension2Height

	rightFrame:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 0)

	if( wc3UI_Options.uiScale <= 250)then
		extraX = wc3UI_Options.uiScale * 0.3388
	else
		extraX = 0
	end

	rightPart_middle:SetWidth(wc3UI_Options.uiScale + (wc3UI_Options.uiScale*0.01851) )
	rightPart_middle:SetHeight(wc3UI_Options.uiScale)
	rightPart_middle:SetPoint("BOTTOMLEFT", actionSlotGrid_4, "BOTTOMRIGHT", wc3UI_Options.uiScale * -0.2479 - 0, -1)

	rightPart_left:SetWidth(wc3UI_Options.uiScale/2)
	rightPart_left:SetHeight(wc3UI_Options.uiScale)
	rightPart_left:SetPoint("BOTTOMRIGHT", rightPart_middle,"BOTTOMLEFT", (rightPart_left:GetWidth())/2 + (wc3UI_Options.uiScale * 0.1) - 0, 0)
	
	if(wc3UI_Options.theme == "human")then
		rightPart_middle:SetPoint("BOTTOMLEFT", actionSlotGrid_4, "BOTTOMRIGHT", wc3UI_Options.uiScale * -0.2479 - 2, -1)
		rightPart_left:SetPoint("BOTTOMRIGHT", rightPart_middle,"BOTTOMLEFT", (rightPart_left:GetWidth())/2 + (wc3UI_Options.uiScale * 0.1) - 2, 0)
	elseif(wc3UI_Options.theme == "orc")then
		rightPart_middle:SetPoint("BOTTOMLEFT", actionSlotGrid_4, "BOTTOMRIGHT", wc3UI_Options.uiScale * -0.2479 - 1, -1)
		rightPart_left:SetPoint("BOTTOMRIGHT", rightPart_middle,"BOTTOMLEFT", (rightPart_left:GetWidth())/2 + (wc3UI_Options.uiScale * 0.1) - 1, 0)

	elseif(wc3UI_Options.theme == "undead")then
		rightPart_middle:SetPoint("BOTTOMLEFT", actionSlotGrid_4, "BOTTOMRIGHT", wc3UI_Options.uiScale * -0.2479 - 1, -1)
		rightPart_left:SetPoint("BOTTOMRIGHT", rightPart_middle,"BOTTOMLEFT", (rightPart_left:GetWidth())/2 + (wc3UI_Options.uiScale * 0.1) - 0, 0)
	end
	-- Increase the size of the lower right area (chat area)
	bottomRight_Top = _G['Wc3_UI_bottom_right_top']
	bottomRight_Top:SetWidth(wc3UI_Options.uiScale)
	bottomRight_Top:SetHeight(wc3UI_Options.uiScale/4)
	bottomRight_Top:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMRIGHT", wc3UI_Options.uiScale * -0.7259, (wc3UI_Options.uiScale * 0.5208) + wc3UI_Options.moveChatAreaUp)

	extraHeight = 0
	if(wc3UI_Options.theme == "human")then
		extraHeight = wc3UI_Options.uiScale * 0.022222
	elseif(wc3UI_Options.theme == "undead")then
		extraHeight = wc3UI_Options.uiScale * 0.022222
	end

	bottomRight_Middle = _G['Wc3_UI_bottom_right_middle']
	bottomRight_Middle:SetWidth(wc3UI_Options.uiScale/16)
	bottomRight_Middle:SetHeight( (wc3UI_Options.uiScale - (wc3UI_Options.uiScale*0.5)) + wc3UI_Options.moveChatAreaUp + extraHeight + (wc3UI_Options.uiScale*0.0208333)) 
	bottomRight_Middle:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMRIGHT", wc3UI_Options.uiScale * -0.0625, 0)
	bottomRight_Middle:SetTexCoord(0, 1, 0, 1)

	if(wc3UI_Options.theme == "human")then
		bottomRight_Middle:SetHeight( (wc3UI_Options.uiScale - (wc3UI_Options.uiScale*0.5)) + wc3UI_Options.moveChatAreaUp + extraHeight) 
	end
	
	bottomRight_Bottom = _G['Wc3_UI_bottom_right_bottom']
	bottomRight_Bottom:SetWidth(wc3UI_Options.uiScale)
	bottomRight_Bottom:SetHeight(wc3UI_Options.uiScale/8)
	bottomRight_Bottom:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMRIGHT", wc3UI_Options.uiScale * -0.7259, 0)

	shiftWidth = 0
	if(wc3UI_Options.theme == "undead")then
		shiftWidth = wc3UI_Options.uiScale * 0.0185185
	end

	Wc3_UI_right_lid:SetWidth(wc3UI_Options.uiScale)
	Wc3_UI_right_lid:SetHeight(wc3UI_Options.uiScale)
	Wc3_UI_right_lid:SetPoint("BOTTOMLEFT", rightPart_middle, "BOTTOMLEFT", wc3UI_Options.uiScale*0.2833333333 - shiftWidth, wc3UI_Options.uiScale * -0.3166 + wc3UI_Options.moveChatAreaUp)
	Wc3_UI_right_lid:SetTexCoord(0,1,0,1)

	WIIIUI_rightpartBackground:SetWidth(wc3UI_Options.rightPartWidth)
	WIIIUI_rightpartBackground:SetHeight(wc3UI_Options.uiScale * 0.5578 + wc3UI_Options.moveChatAreaUp)
	WIIIUI_rightpartBackground:SetPoint("BOTTOMLEFT", rightPart_left,"BOTTOMRIGHT", 3, 0)

	if(wc3UI_Options.uiScale >= 250 and wc3UI_Options.uiScale <= 259)then
		alignExtraHorizontal = -3
	elseif(wc3UI_Options.uiScale > 259)then
		alignExtraHorizontal = -6
	else
		alignExtraHorizontal = 0
	end

	bottomRightExtensionTop_1 = _G['Wc3_UI_right_right_extendedFillerTop_1']
	bottomRightExtensionTop_1:SetWidth(wc3UI_Options.uiScale/2)
	bottomRightExtensionTop_1:SetHeight(wc3UI_Options.uiScale/4)
	bottomRightExtensionTop_1:SetPoint("BOTTOMLEFT", rightPart_middle,"BOTTOMRIGHT", wc3UI_Options.uiScale * -0.09 + alignExtraHorizontal, wc3UI_Options.uiScale * 0.5206 + wc3UI_Options.moveChatAreaUp)
	bottomRightExtensionBottom_1 = _G['Wc3_UI_right_right_extendedFillerBottom_1']
	bottomRightExtensionBottom_1:SetWidth(wc3UI_Options.uiScale/2)
	bottomRightExtensionBottom_1:SetHeight(wc3UI_Options.uiScale/16)
	bottomRightExtensionBottom_1:SetPoint("BOTTOMLEFT", rightPart_middle,"BOTTOMRIGHT", wc3UI_Options.uiScale*-0.03703, 0)
	if(wc3UI_Options.uiScale >= 269)then
		--bottomRightExtensionTop_1:Hide()
		if(wc3UI_Options.theme == "human")then
			bottomRightExtensionTop_1:Hide()
		elseif(wc3UI_Options.theme == "undead")then
			bottomRightExtensionTop_1:Hide()
		end
	else
		bottomRightExtensionTop_1:Show()
	end

	bottomRightExtensionTop_2 = _G['Wc3_UI_right_right_extendedFillerTop_2']
	bottomRightExtensionTop_2:SetWidth(wc3UI_Options.uiScale/2)
	bottomRightExtensionTop_2:SetHeight(wc3UI_Options.uiScale/4)
	bottomRightExtensionTop_2:SetPoint("BOTTOMLEFT", bottomRightExtensionBottom_1,"BOTTOMLEFT", wc3UI_Options.uiScale * 0.2291 + alignExtraHorizontal, wc3UI_Options.uiScale * 0.5206 + wc3UI_Options.moveChatAreaUp)
	bottomRightExtensionTop_2:SetTexCoord(0,1,0,1)
	bottomRightExtensionBottom_2 = _G['Wc3_UI_right_right_extendedFillerBottom_2']
	bottomRightExtensionBottom_2:SetWidth(wc3UI_Options.uiScale/2)
	bottomRightExtensionBottom_2:SetHeight(wc3UI_Options.uiScale/16)
	bottomRightExtensionBottom_2:SetPoint("BOTTOMLEFT", bottomRightExtensionBottom_1,"BOTTOMLEFT", wc3UI_Options.uiScale * 0.2768, 0)
	if(wc3UI_Options.uiScale >= 258)then
		bottomRightExtensionTop_2:Hide()
		bottomRightExtensionBottom_2:Hide()
	else
		bottomRightExtensionTop_2:Show()
		bottomRightExtensionBottom_2:Show()
	end

	bottomRightExtensionTop_3 = _G['Wc3_UI_right_right_extendedFillerTop_3']
	bottomRightExtensionTop_3:SetWidth(wc3UI_Options.uiScale/2)
	bottomRightExtensionTop_3:SetHeight(wc3UI_Options.uiScale/4)
	bottomRightExtensionTop_3:SetPoint("BOTTOMLEFT", bottomRightExtensionBottom_2,"BOTTOMLEFT", wc3UI_Options.uiScale * 0.2291 + alignExtraHorizontal, wc3UI_Options.uiScale * 0.5206 + wc3UI_Options.moveChatAreaUp)
	bottomRightExtensionBottom_3 = _G['Wc3_UI_right_right_extendedFillerBottom_3']
	bottomRightExtensionBottom_3:SetWidth(wc3UI_Options.uiScale/2)
	bottomRightExtensionBottom_3:SetHeight(wc3UI_Options.uiScale/16)
	bottomRightExtensionBottom_3:SetPoint("BOTTOMLEFT", bottomRightExtensionBottom_2,"BOTTOMLEFT", wc3UI_Options.uiScale * 0.2768, 0)
	bottomRightExtensionTop_3:Hide()
	bottomRightExtensionBottom_3:Hide()
	if(wc3UI_Options.uiScale >= 246) then
		
		bottomRightExtensionTop_3:Hide()
		bottomRightExtensionBottom_3:Hide()
		
	elseif(wc3UI_Options.uiScale <= 245)then
		bottomRightExtensionTop_3:Show()
		bottomRightExtensionBottom_3:Show()
	end

	-- Undead aligner for bottom right
	if(wc3UI_Options.theme == "undead")then

		offset = 15
		offset2 = 0

		shiftExtra = 270 - wc3UI_Options.uiScale

		bottomRightExtensionTop_1:Hide()
		bottomRightExtensionTop_2:Hide()
		bottomRightExtensionTop_3:Hide()

		alignExtraHorizontal = 0
		alignExtraHorizontal2 = 0

		offsetExtension1 = wc3UI_Options.uiScale * 0.083333333

		extension3:SetWidth(wc3UI_Options.uiScale - 0)
		extension3:SetHeight(wc3UI_Options.uiScale/8)
		extension3:SetPoint("BOTTOMLEFT", extension1, "BOTTOMRIGHT", wc3UI_Options.uiScale*-0.088888888 + 2, 2)

		if(wc3UI_Options.uiScale == 270)then
			offset = 0
		elseif(wc3UI_Options.uiScale == 269)then
			offset = 17
		elseif(wc3UI_Options.uiScale == 268)then
			offset = 23
		elseif(wc3UI_Options.uiScale == 267)then
			offset = 27
			offset2 = wc3UI_Options.uiScale * 0.014981 - 2
		elseif(wc3UI_Options.uiScale == 266)then
			offset = 33
			offset2 = wc3UI_Options.uiScale * 0.014981 - 2
		elseif(wc3UI_Options.uiScale == 265)then
			offset = 40
			offset2 = wc3UI_Options.uiScale * 0.014981 - 2
		elseif(wc3UI_Options.uiScale == 264)then
			offset = 45
			offset2 = wc3UI_Options.uiScale * 0.014981 - 2
		elseif(wc3UI_Options.uiScale == 263)then
			offset = 51
			offset2 = wc3UI_Options.uiScale * 0.014981 - 2
		elseif(wc3UI_Options.uiScale == 262)then
			offset = 59
			offset2 = wc3UI_Options.uiScale * 0.014981 - 2
		elseif(wc3UI_Options.uiScale == 261)then
			offset = 68
			offset2 = wc3UI_Options.uiScale * 0.014981 - 2
		elseif(wc3UI_Options.uiScale == 260)then
			offset = 77
			offset2 = wc3UI_Options.uiScale * 0.014981 - 2
		elseif(wc3UI_Options.uiScale >= 257)then
			bottomRightExtensionTop_1:Show()
			
			shiftExtra = 261 - wc3UI_Options.uiScale
			alignExtraHorizontal = 25
			bottomRightExtensionTop_1:SetWidth(wc3UI_Options.uiScale/2 - 0)
		elseif(wc3UI_Options.uiScale <= 256)then
			bottomRightExtensionTop_1:Show()
			
			shiftExtra = 258 - wc3UI_Options.uiScale
			offset = 25
			offset2 = wc3UI_Options.uiScale * 0.014981 - 2

			alignExtraHorizontal = 40
			bottomRightExtensionTop_1:SetWidth(wc3UI_Options.uiScale/2 - (10 - (shiftExtra*2 + 5)))
			if(wc3UI_Options.uiScale == 253)then
				offset = 28
			elseif(wc3UI_Options.uiScale >= 250 and wc3UI_Options.uiScale <= 252)then
				offset = 40
				bottomRightExtensionTop_1:SetWidth(wc3UI_Options.uiScale/2 + 35)
			elseif(wc3UI_Options.uiScale <= 249)then
				offset = 53
				alignExtraHorizontal = 53
				if(wc3UI_Options.uiScale == 249)then
					bottomRightExtensionTop_1:SetWidth(wc3UI_Options.uiScale/2 + 35)
				elseif(wc3UI_Options.uiScale >= 247 and wc3UI_Options.uiScale <= 248)then

					bottomRightExtensionTop_1:SetWidth(wc3UI_Options.uiScale/2 + 45)
				elseif(wc3UI_Options.uiScale == 246)then
					offset = 65
					alignExtraHorizontal = 60
					bottomRightExtensionTop_1:SetWidth(wc3UI_Options.uiScale/2 + 45)
				elseif(wc3UI_Options.uiScale == 245)then
					offset = 65
					alignExtraHorizontal = 61
					bottomRightExtensionTop_1:SetWidth(wc3UI_Options.uiScale/2 + 52)
				else
					bottomRightExtensionTop_2:Show()	
					shiftExtra = 0
					offset = 0
					alignExtraHorizontal = 20
					alignExtraHorizontal2 = 87
					bottomRightExtensionTop_1:SetWidth(wc3UI_Options.uiScale/2 + 0)
					bottomRightExtensionTop_2:SetWidth(wc3UI_Options.uiScale/2 + 25)
					if(wc3UI_Options.uiScale >= 242 and wc3UI_Options.uiScale <= 243)then
						bottomRightExtensionTop_2:SetWidth(wc3UI_Options.uiScale/2 + 38)

					elseif(wc3UI_Options.uiScale <= 241)then
						alignExtraHorizontal = 23
						bottomRightExtensionTop_1:SetWidth(wc3UI_Options.uiScale/2 + 25)
						alignExtraHorizontal2 = 102
						bottomRightExtensionTop_2:SetWidth(wc3UI_Options.uiScale/2 + 35)


					end
				end
			end
		end

		extension1:SetWidth(wc3UI_Options.uiScale)
		extension1:SetHeight(wc3UI_Options.uiScale * 0.12592)
		extension1:SetPoint("BOTTOMLEFT", portraitFrame, "BOTTOMRIGHT", wc3UI_Options.uiScale*-0.15 + offsetExtension1, wc3UI_Options.uiScale*0.45)

		extension2:SetWidth(wc3UI_Options.uiScale + wc3UI_Options.uiScale*0.54166666)
		if(wc3UI_Options.uiScale <= 255)then
			extension2:SetWidth(wc3UI_Options.uiScale + 145)
		end

		extension2Height = 1
		if(wc3UI_Options.uiScale <= 269)then
			extension2Height = 1
		end

		extension2:SetHeight(wc3UI_Options.uiScale * 0.12592 - extension2Height)
		extension2:SetTexCoord(0.09, 1, 0, 1)
		extension2:SetPoint("BOTTOMLEFT", extension1, "BOTTOMRIGHT", -125, 0)


		bottomRightExtensionTop_1:SetPoint("BOTTOMLEFT", rightPart_middle,"BOTTOMRIGHT", wc3UI_Options.uiScale * -0.09 + alignExtraHorizontal, wc3UI_Options.uiScale * 0.5206 + wc3UI_Options.moveChatAreaUp + 1)
		bottomRightExtensionTop_2:SetPoint("BOTTOMLEFT", rightPart_middle,"BOTTOMRIGHT", wc3UI_Options.uiScale * -0.09 + alignExtraHorizontal2, wc3UI_Options.uiScale * 0.5206 + wc3UI_Options.moveChatAreaUp + 1)

		Wc3_UI_right_lid:SetWidth(wc3UI_Options.uiScale + offset)
		Wc3_UI_right_lid:SetPoint("BOTTOMLEFT", rightPart_middle, "BOTTOMLEFT", wc3UI_Options.uiScale*0.2833333333 - shiftWidth - shiftExtra, wc3UI_Options.uiScale * -0.3166 + wc3UI_Options.moveChatAreaUp)

		bottomRight_Top:SetWidth(wc3UI_Options.uiScale + offset2)
		bottomRight_Top:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMRIGHT", wc3UI_Options.uiScale * -0.7259  - offset2, (wc3UI_Options.uiScale * 0.5208) + wc3UI_Options.moveChatAreaUp)
	end

	-- Night elf aligner for bottom right
	if(wc3UI_Options.theme == "nightelf")then

		extension1:ClearAllPoints()
		extension1:SetParent("WIIIUI_leftpart")
		extension1:SetWidth(wc3UI_Options.uiScale)
		extension1:SetHeight(wc3UI_Options.uiScale/4)
		extension1:SetPoint("BOTTOMLEFT", portraitFrame, "BOTTOMRIGHT", wc3UI_Options.uiScale*-0.096296, wc3UI_Options.uiScale*0.43333)

		extension2:SetWidth(wc3UI_Options.uiScale)
		extension2:SetHeight(wc3UI_Options.uiScale/4)
		extension2:SetPoint("BOTTOMLEFT", portraitFrame, "BOTTOMRIGHT", wc3UI_Options.uiScale*0.685185 - 5, wc3UI_Options.uiScale*0.43333)
		extension2:SetParent("WIIIUI_leftpart")
	
		extension3:ClearAllPoints()
		extension3:SetWidth(wc3UI_Options.uiScale/2)
		extension3:SetHeight(wc3UI_Options.uiScale/4)
		extension3:SetPoint("BOTTOMLEFT", extension2, "BOTTOMRIGHT", wc3UI_Options.uiScale*-0.296296, 0)
		extension3:SetParent("WIIIUI_leftpart")
		extension3:SetDrawLayer("OVERLAY")

		if(wc3UI_Options.uiScale >= 267)then
			Wc3_UI_right_lid:SetWidth(wc3UI_Options.uiScale*0.7890625)
			if(wc3UI_Options.uiScale == 267)then
				Wc3_UI_right_lid:SetWidth(wc3UI_Options.uiScale*0.7890625 + 3)
			end
			Wc3_UI_right_lid:SetTexCoord(0,0.7890625,0,1)
		end

		bottomRight_Top:SetWidth(wc3UI_Options.uiScale + wc3UI_Options.uiScale*0.088888)
		bottomRight_Top:SetHeight(wc3UI_Options.uiScale/4 + wc3UI_Options.uiScale*0.088888/4)
		bottomRight_Top:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMRIGHT", wc3UI_Options.uiScale * -0.7259 - wc3UI_Options.uiScale*0.17037037, (wc3UI_Options.uiScale * 0.5208) + wc3UI_Options.moveChatAreaUp)
		
		extraHeight = wc3UI_Options.uiScale * 0.022222
		makeSmaller = 0
		if(wc3UI_Options.uiScale > 252 and wc3UI_Options.uiScale <= 260)then
			makeSmaller = 1
		elseif(wc3UI_Options.uiScale > 250 and wc3UI_Options.uiScale <= 252)then
			makeSmaller = 2
		elseif(wc3UI_Options.uiScale == 250)then
			makeSmaller = 3
		elseif(wc3UI_Options.uiScale <= 249	)then
			makeSmaller = 4
		end
		bottomRight_Middle:SetWidth(270/8 + wc3UI_Options.uiScale*0.088888/8 - makeSmaller)
		bottomRight_Middle:SetHeight( (wc3UI_Options.uiScale - (wc3UI_Options.uiScale*0.5)) + wc3UI_Options.moveChatAreaUp + extraHeight + 1) 

		emptySpace = 0.04296875
		cutTexCoord = 0
		top = emptySpace
		if(wc3UI_Options.moveChatAreaUp > 90 and wc3UI_Options.moveChatAreaUp < 100)then
			cutTexCoord = 0.05
		elseif(wc3UI_Options.moveChatAreaUp > 70 and wc3UI_Options.moveChatAreaUp <= 90 )then
			cutTexCoord = 0.1
		elseif(wc3UI_Options.moveChatAreaUp > 40 and wc3UI_Options.moveChatAreaUp <= 70 )then
			cutTexCoord = 0.25
		elseif(wc3UI_Options.moveChatAreaUp > 30 and wc3UI_Options.moveChatAreaUp <= 40 )then
			cutTexCoord = 0.38
		elseif(wc3UI_Options.moveChatAreaUp >= 0 and wc3UI_Options.moveChatAreaUp <= 30 )then
			cutTexCoord = 0.475
		end
		top = top + cutTexCoord
		bottomRight_Middle:SetTexCoord(0, 1, top, 1 )

		bottomRight_Middle:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMRIGHT", -37 + makeSmaller, 0)
		
		shiftWidth = 6
		Wc3_UI_right_lid:SetPoint("BOTTOMLEFT", rightPart_middle, "BOTTOMLEFT", wc3UI_Options.uiScale*0.2833333333 - shiftWidth, wc3UI_Options.uiScale * -0.3166 + wc3UI_Options.moveChatAreaUp + 6)

		bottomRightExtensionTop_1:Hide()
		bottomRightExtensionTop_2:Hide()
		bottomRightExtensionTop_3:Hide()

		if(wc3UI_Options.uiScale <= 260)then
			bottomRightExtensionTop_1:Show()

			if(wc3UI_Options.uiScale >= 250)then
				alignExtraHorizontal = 50
			elseif(wc3UI_Options.uiScale >= 247 and wc3UI_Options.uiScale <= 249)then
				alignExtraHorizontal = 60
			else
				alignExtraHorizontal = 35
				alignExtraHorizontal2 = 5
				bottomRightExtensionTop_2:Show()
				bottomRightExtensionTop_2:SetPoint("BOTTOMLEFT", bottomRightExtensionBottom_1,"BOTTOMLEFT", wc3UI_Options.uiScale * 0.2291 + alignExtraHorizontal2, wc3UI_Options.uiScale * 0.5206 + wc3UI_Options.moveChatAreaUp)
				bottomRightExtensionTop_2:SetTexCoord(1,0,0,1)
			end
			bottomRightExtensionTop_1:SetPoint("BOTTOMLEFT", rightPart_middle,"BOTTOMRIGHT", wc3UI_Options.uiScale * -0.09 + alignExtraHorizontal, wc3UI_Options.uiScale * 0.5206 + wc3UI_Options.moveChatAreaUp)
		end
	end

end

-- Re-align things on edit
function AlignUI()

	local elapsedTime

	elapsedTime = 0
	dummyFrame:SetScript('OnUpdate', function(self)
		elapsedTime = elapsedTime + arg1
		if(elapsedTime > 0) then
			
			-- Frame pos and size
			AlignBuffFrame()		-- Buff position
			
			AlignMinimap()			-- Bottom left UI, Minimap ½portrait
			AlignPortrait()			-- Bottom left UI, ½portrait info area
			AlignZoneText()

			AlignMiddleExtension()	-- Middle UI, extension of grid area
			AlignActionBarUIGrid()	-- Middle UI, Grid area
			
			AlignRightPart()		-- Right UI, The right part of the UI
			AlignInventorySlots()	-- Align main inventory frame

			leftFrame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", minimapFrame:GetWidth()/2 - 1, 0) -- UI is aligned based off this (mostly).
			leftFrame:SetParent(UIParent)

			AlignHealthMana() 		-- Delay this to later stages, either the proper way or through an update nil?
			AlignPetFrames()		-- Middle Top UI, aligns pet frame
			AlignBags()
			AlignChatFrames()		-- We change where the input field is and increases the framestrata so it is displayed over our UI
			AlignActionBars()		-- Align the actionbar grid
			AlignMicroButtons()		-- Micro buttons aligner

			xpProgBarMax = wc3UI_Options.uiScale*0.6814
			AlignXPBar()			-- Middle UI, XP bar
			for i=1, 3, 1 do
				AlignWeaponFrame(i)	-- Middle UI, Weapon icons
			end
			AlignArmorFrame()		-- Middle UI, Armor icon
			CheckIfInForm() 		-- Applies form icons on load

			InventorySlots()		-- Position our 2x3 inventory slots and edits the frames
			ModifyPlayerPortrait()	-- Changes size and so we get the face camera
			PutHearthstoneInActionBar() -- Puts the hearthstone into the top actionbar besides the minimap if it is empty
			AlignPlayerIcons()			-- Align the rested, combaet etc icons.

			AlignShapeshiftButtons()
			SwitchMainActionBarEvent()
			ChangeCastbarAlignment()	-- Align position of the cast bar, we have to nest the AlignCastBar() for some reason, otherwise the change does not get applied
			AlignActionBars()
			CombatTextPortrait()

			if(wc3UI_Options.ultraWide or wc3UI_Options.centerSlim or wc3UI_Options.centerSlimNoInv)then
				if(wc3UI_Options.theme == "nightelf" and WIIIUI_leftpart.night_elf_tree)then
					WIIIUI_leftpart.night_elf_tree:SetWidth(wc3UI_Options.uiScale*0.9846153)
					WIIIUI_leftpart.night_elf_tree:SetHeight(wc3UI_Options.uiScale*1.03461538)
				end
				AlignUltraWide()
			end
		
			dummyFrame:SetScript("OnUpdate", nil)
		end
	end)	


end

function ResetPowerBarColor()

	local powerType = UnitPowerType("player");

	if(powerType == 0)then		-- Mana
		PlayerFrameManaBar:SetStatusBarColor(0, 0, 1, 1)	
	elseif(powerType == 1)then	-- Rage
		PlayerFrameManaBar:SetStatusBarColor(1, 0, 0, 1)
	elseif(powerType == 3)then	-- Energy
		PlayerFrameManaBar:SetStatusBarColor(1, 1, 0, 1)
	end
end

function LowHPWarning()

	local healthPercent
	local evenStarted = false
	local fullRedTime
	local blackToRed
	local number

	if( not _G['WIIIUI_lowHPEvent'] ) then
		lowHPEvent = CreateFrame("Frame", "WIIIUI_lowHPEvent", UIParent, nil)
	end
	
	lowHPEvent:RegisterEvent("UNIT_HEALTH");
	lowHPEvent:RegisterEvent("UNIT_MAXHEALTH");
	lowHPEvent:RegisterEvent("PLAYER_DEAD");
	lowHPEvent:SetScript("OnEvent", function()	

		if(event == "PLAYER_DEAD")then
			lowHPEvent:SetScript("OnUpdate", nil)
		end

		if(arg1 == "player")then

			healthPercent = UnitHealth("player") / UnitHealthMax("player");	
			if(healthPercent <= (wc3UI_Options.hpWarning / 100))then

				fullRedTime = 1
				blackToRed = true
				if(not evenStarted)then
			
					--if(not wc3UI_Options.EnableCustomize)then
					PortraitBackground:SetTexture("Interface\\AddOns\\WIIIUI\\art\\other\\white_background")
					--end

					evenStarted = true 
					number = 0


					lowHPEvent:SetScript("OnUpdate", function()
						if(blackToRed)then
							number = number + (arg1 / fullRedTime)
							PortraitBackground:SetVertexColor(number,0,0,1)
							if(number >= 1)then
								blackToRed = false
							end
						else
							number = number - (arg1 / fullRedTime)
							PortraitBackground:SetVertexColor(number,0,0,1)
							if(number <= 0)then
								blackToRed = true
							end
						end
		
					end)
				end
			else
				evenStarted = false
				lowHPEvent:SetScript("OnUpdate", nil)
				PortraitBackground:SetTexture("Interface\\AddOns\\WIIIUI\\art\\other\\black_background")
				--if(not wc3UI_Options.EnableCustomize)then
					--PortraitBackground:SetTexture("Interface\\AddOns\\WIIIUI\\art\\other\\black_background")
				--else
				--	PortraitBackground:SetVertexColor(1,1,1,1)
				--end
			end
		end

	end)
end

function VisibilityChatArrows()

	ChatFrameMenuButton:SetFrameStrata("HIGH")
	ChatFrameMenuButton:SetFrameLevel(505)

	if(wc3UI_Options.HideChatArrows)then
		ChatFrameMenuButton:Hide()
		ChatFrameMenuButton.Show = function() end

		for i=1, 20, 1 do

			local chatFrameDown = _G['ChatFrame'..i..'DownButton']
			local chatFrameUp = _G['ChatFrame'..i..'UpButton']
			local chatFrameBottom = _G['ChatFrame'..i..'BottomButton']

			if(chatFrameDown ~= nil)then
				chatFrameDown:Hide()
				chatFrameUp:Hide()
				chatFrameBottom:Hide()
				
				chatFrameDown.Show = function() end
				chatFrameUp.Show = function() end
				chatFrameBottom.Show = function() end
			else
				break;
			end
		end
	end
end

function HPBarDamageGradiant()

	local healthPercent
	local r, g, b

	if( not _G['WIIIUI_hpBarDamageGradiant'] ) then
		hpBarGradiant = CreateFrame("Frame", "WIIIUI_hpBarDamageGradiant", UIParent, nil)
	end
	
	hpBarGradiant:RegisterEvent("UNIT_HEALTH");
	hpBarGradiant:RegisterEvent("UNIT_MAXHEALTH");
	hpBarGradiant:SetScript("OnEvent", function()

		if(arg1 == "player") then
			healthPercent = UnitHealth("player") / UnitHealthMax("player");	
			if(healthPercent < 0.5)then
				r = 1
				g = 2*healthPercent
				b = 0
			else
				r = 2*(1 - healthPercent)
				g = 1
				b = 0
			end
			PlayerFrameHealthBar:SetStatusBarColor(r, g, b, 1)
		end

	end)
end

function SwitchMainActionBarEvent()

	local actionButton
	local size

	if(BonusActionBarFrame:IsVisible())then

		for i=1, 12, 1 do
			actionButton = _G['ActionButton'..i]
			actionButton:Hide()
			actionButton:SetAlpha(0)

			actionButton = _G['BonusActionButton'..i]
			actionButton:SetAlpha(1)
		end
	end

	BonusActionBarFrame:SetScript("OnShow", function()
		for i=1, 12, 1 do
			actionButton = _G['ActionButton'..i]
			actionButton:Hide()
			actionButton:SetAlpha(0)

			actionButton = _G['BonusActionButton'..i]
			actionButton:SetAlpha(1)
		end
	end)
	BonusActionBarFrame:SetScript("OnHide", function()
		for i=1, 12, 1 do
			actionButton = _G['ActionButton'..i]
			actionButton:Show()
			actionButton:SetAlpha(1)

			actionButton = _G['BonusActionButton'..i]
			actionButton:SetAlpha(0)
		end
	end)

	size = wc3UI_Options.uiScale*0.12962
end

function MapActionBarFix()

	local actionButton

	if(BonusActionBarFrame:IsVisible())then

		for i=1, 12, 1 do
			actionButton = _G['ActionButton'..i]
			actionButton:Hide()
			actionButton:SetAlpha(0)

			actionButton = _G['BonusActionButton'..i]
			actionButton:SetAlpha(1)
		end
	end
end

-- Calculates total block value and returns it
function GetBlockValue()

	local BV_Prefix = "getExtendedData"
	local BV_Tooltip = _G['getExtendedData'] or CreateFrame("GameTooltip", 'getExtendedData', nil, "GameTooltipTemplate")
	BV_Tooltip:SetOwner(WorldFrame, "ANCHOR_NONE")

	local __, totalStr, posStr, negStr = UnitStat("player", 1)
	startStrengthRaces = {
		['Human'] = 20,
		['Dwarf'] = 22,
		['Night Elf'] = 17,
		['Gnome'] = 15,
		['High Elf'] = 20,
		['Orc'] = 23,
		['Undead'] = 19,
		['Tauren'] = 25,
		['Troll'] = 21,
		['Goblin'] = 23	
	}
	local blockValue = floor((totalStr - startStrengthRaces[UnitRace("player")])/20); -- Calculates the block value we get from Strength. (Base strength does not add block value)
	
	-- loop through all character slots and add the block value to blockValue
	local isShield = false
	local MAX_INVENTORY_SLOTS = 19
	for slot=0, MAX_INVENTORY_SLOTS do
		local hasItem = BV_Tooltip:SetInventoryItem("player", slot)
		
		if hasItem then
			for line=1, 30 do
				local left = _G[BV_Prefix .. "TextLeft" .. line]
				
				if left:GetText() then
					local _,_, value = strfind(left:GetText(), "Increases the block value of your shield by (%d+).")
					if value then
						blockValue = blockValue + tonumber(value)
					end
				end
				if left:GetText() then
					local _,_, value = strfind(left:GetText(), "(%d+) Block")
					if value then
						isShield = true
						blockValue = blockValue + tonumber(value)
					end
				end
			end
		end
		
	end

	-- Check for talents
	local blockFromTalents = 0
	local MAX_TABS = GetNumTalentTabs()
	for tab=1, MAX_TABS do
		local MAX_TALENTS = GetNumTalents(tab)
		
		for talent=1, MAX_TALENTS do
			BV_Tooltip:SetTalent(tab, talent)
			local MAX_LINES = BV_Tooltip:NumLines()
			
			for line=1, MAX_LINES do
				local left = getglobal(BV_Prefix .. "TextLeft" .. line)
				if left:GetText() then
					-- Paladin
					-- Shield Specialization
					local _,_, value = strfind(left:GetText(), "Increases the amount of damage absorbed by your shield by (%d+)%%.")
					local name, iconTexture, tier, column, rank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(tab, talent)
					if value and rank > 0 then
						
						blockFromTalents = (blockValue * value) 

						-- nothing more is currenlty supported, break out of the loops
						line = MAX_LINES
						talent = MAX_TALENTS
						tab = MAX_TABS
					end

					-- Shaman
					-- Shield Specialization
					local _,_, value = strfind(left:GetText(), "and increases the amount blocked by (%d+)%%.")
					local name, iconTexture, tier, column, rank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(tab, talent)
					if value and rank > 0 then
						
						blockFromTalents = (blockValue * value) 
						
						-- nothing more is currenlty supported, break out of the loops
						line = MAX_LINES
						talent = MAX_TALENTS
						tab = MAX_TABS
					end

				end	
			end
			
		end
	end

	blockValue = blockValue + blockFromTalents
	return blockValue, isShield

end

function GetPlayerAura(searchText, auraType)

	local GA_Prefix = "getExtendedDataAura"
	local GA_Tooltip = _G['getExtendedDataAura'] or CreateFrame("GameTooltip", 'getExtendedDataAura', nil, "GameTooltipTemplate")
	GA_Tooltip:SetOwner(WorldFrame, "ANCHOR_NONE")

	if not auraType then
		-- buffs
		-- http://blue.cardplace.com/cache/wow-dungeons/624230.htm
		-- 32 buffs max
		for i=0, 31 do
			local index = GetPlayerBuff(i, 'HELPFUL')
			if index > -1 then
				GA_Tooltip:SetPlayerBuff(index)
				local MAX_LINES = GA_Tooltip:NumLines()
					
				for line=1, MAX_LINES do
					local left = getglobal(GA_Prefix .. "TextLeft" .. line)
					if left:GetText() then
						local value = {strfind(left:GetText(), searchText)}
						if value[1] then
							return unpack(value)
						end
					end
				end
			end
		end
	elseif auraType == 'HARMFUL' then
		for i=0, 6 do
			local index = GetPlayerBuff(i, auraType)
			if index > -1 then
				GA_Tooltip:SetPlayerBuff(index)
				local MAX_LINES = GA_Tooltip:NumLines()
					
				for line=1, MAX_LINES do
					local left = getglobal(GA_Prefix .. "TextLeft" .. line)
					if left:GetText() then
						local value = {strfind(left:GetText(), searchText)}
						if value[1] then
							return unpack(value)
						end
					end
				end
			end
		end
	end
end

local function tContains(table, item)
	local index = 1
	while table[index] do
		if ( item == table[index] ) then
			return 1
		end
		index = index + 1
	end
	return nil
end
-- Calculates Spell power
function GetSpellpowerValue()

	local SP_Prefix = "getExtendedData"
	local SP_Tooltip = _G['getExtendedData'] or CreateFrame("GameTooltip", 'getExtendedData', nil, "GameTooltipTemplate")
	SP_Tooltip:SetOwner(WorldFrame, "ANCHOR_NONE")

	local spellPower = 0;
	local arcanePower = 0;
	local firePower = 0;
	local frostPower = 0;
	local holyPower = 0;
	local naturePower = 0;
	local shadowPower = 0;
	local damagePower = 0;
	local MAX_INVENTORY_SLOTS = 19
	
	local SpellPower_Set_Bonus = {}
	
	-- scan gear
	for slot=0, MAX_INVENTORY_SLOTS do
		local hasItem = SP_Tooltip:SetInventoryItem("player", slot)
		
		if hasItem then
			local SET_NAME
			
			for line=1, SP_Tooltip:NumLines() do
				local left = getglobal(SP_Prefix .. "TextLeft" .. line)
				
				if left:GetText() then
					local _,_, value = strfind(left:GetText(), "Equip: Increases damage and healing done by magical spells and effects by up to (%d+).")
					if value then
						spellPower = spellPower + tonumber(value)
					end
					_,_, value = strfind(left:GetText(), "Spell Damage %+(%d+)")
					if value then
						spellPower = spellPower + tonumber(value)
					end
					_,_, value = strfind(left:GetText(), "^%+(%d+) Spell Damage and Healing")
					if value then
						spellPower = spellPower + tonumber(value)
					end
					_,_, value = strfind(left:GetText(), "^%+(%d+) Damage and Healing Spells")
					if value then
						spellPower = spellPower + tonumber(value)
					end
					
					_,_, value = strfind(left:GetText(), "Equip: Increases damage done by Arcane spells and effects by up to (%d+).")
					if value then
						arcanePower = arcanePower + tonumber(value)
					end
					_,_, value = strfind(left:GetText(), "^%+(%d+) Arcane Spell Damage")
					if value then
						arcanePower = arcanePower + tonumber(value)
					end
					
					_,_, value = strfind(left:GetText(), "Equip: Increases damage done by Fire spells and effects by up to (%d+).")
					if value then
						firePower = firePower + tonumber(value)
					end
					_,_, value = strfind(left:GetText(), "Fire Damage %+(%d+)")
					if value then
						firePower = firePower + tonumber(value)
					end
					_,_, value = strfind(left:GetText(), "^%+(%d+) Fire Spell Damage")
					if value then
						firePower = firePower + tonumber(value)
					end
					
					_,_, value = strfind(left:GetText(), "Equip: Increases damage done by Frost spells and effects by up to (%d+).")
					if value then
						frostPower = frostPower + tonumber(value)
					end
					_,_, value = strfind(left:GetText(), "Frost Damage %+(%d+)")
					if value then
						frostPower = frostPower + tonumber(value)
					end
					_,_, value = strfind(left:GetText(), "^%+(%d+) Frost Spell Damage")
					if value then
						frostPower = frostPower + tonumber(value)
					end
					
					_,_, value = strfind(left:GetText(), "Equip: Increases damage done by Holy spells and effects by up to (%d+).")
					if value then
						holyPower = holyPower + tonumber(value)
					end
					_,_, value = strfind(left:GetText(), "^%+(%d+) Holy Spell Damage")
					if value then
						holyPower = holyPower + tonumber(value)
					end
					
					_,_, value = strfind(left:GetText(), "Equip: Increases damage done by Nature spells and effects by up to (%d+).")
					if value then
						naturePower = naturePower + tonumber(value)
					end
					_,_, value = strfind(left:GetText(), "^%+(%d+) Nature Spell Damage")
					if value then
						naturePower = naturePower + tonumber(value)
					end
					
					_,_, value = strfind(left:GetText(), "Equip: Increases damage done by Shadow spells and effects by up to (%d+).")
					if value then
						shadowPower = shadowPower + tonumber(value)
					end
					_,_, value = strfind(left:GetText(), "Shadow Damage %+(%d+)")
					if value then
						shadowPower = shadowPower + tonumber(value)
					end
					_,_, value = strfind(left:GetText(), "^%+(%d+) Shadow Spell Damage")
					if value then
						shadowPower = shadowPower + tonumber(value)
					end
					
					_,_, value = strfind(left:GetText(), "(.+) %(%d/%d%)")
					if value then
						SET_NAME = value
					end

					
					_, _, value = strfind(left:GetText(), "^Set: Increases damage and healing done by magical spells and effects by up to (%d+)%.")
					if value and SET_NAME and not tContains(SpellPower_Set_Bonus, SET_NAME) then
						tinsert(SpellPower_Set_Bonus, SET_NAME)
						spellPower = spellPower + tonumber(value)
					end
					
				end
			end
		end
		
	end
	
	-- scan talents
	local MAX_TABS = GetNumTalentTabs()
	
	for tab=1, MAX_TABS do
		local MAX_TALENTS = GetNumTalents(tab)
		
		for talent=1, MAX_TALENTS do
			SP_Tooltip:SetTalent(tab, talent)
			local MAX_LINES = SP_Tooltip:NumLines()
			
			for line=1, MAX_LINES do
				local left = getglobal(SP_Prefix .. "TextLeft" .. line)
				if left:GetText() then
					-- Priest
					-- Spiritual Guidance
					local _,_, value = strfind(left:GetText(), "Increases spell damage and healing by up to (%d+)%% of your total Spirit.")
					local name, iconTexture, tier, column, rank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(tab, talent)
					if value and rank > 0 then
						local stat, effectiveStat = UnitStat("player", 5)
						spellPower = spellPower + floor(((tonumber(value) / 100) * effectiveStat))
						
						-- nothing more is currenlty supported, break out of the loops
						line = MAX_LINES
						talent = MAX_TALENTS
						tab = MAX_TABS
					end
				end	
			end
			
		end
	end
	
	-- buffs
	local _, _, spellPowerFromAura = GetPlayerAura("Magical damage dealt is increased by up to (%d+).")
	if spellPowerFromAura then
		spellPower = spellPower + tonumber(spellPowerFromAura)
		damagePower = damagePower + tonumber(spellPowerFromAura)
	end

	-- buffs
	local _, _, spellPowerFromAura = GetPlayerAura("Increased damage done by magical spells and effects by (%d+).")
	if spellPowerFromAura then
		spellPower = spellPower + tonumber(spellPowerFromAura)
		damagePower = damagePower + tonumber(spellPowerFromAura)
	end
	
	local secondaryPower = 0
	local secondaryPowerName = ""
	local storedPowers = {}
	storedPowers['arcane']  = 0
	storedPowers['fire']  = 0
	storedPowers['frost'] = 0
	storedPowers['holy']  = 0
	storedPowers['nature']  = 0
	storedPowers['shadow'] = 0

	if arcanePower > secondaryPower then
		storedPowers['arcane']  = arcanePower
		secondaryPowerName = SPELL_SCHOOL_ARCANE
	end
	if firePower > secondaryPower then
		storedPowers['fire']  = firePower
		secondaryPowerName = SPELL_SCHOOL_FIRE
	end
	if frostPower > secondaryPower then
		storedPowers['frost'] = frostPower
		secondaryPowerName = SPELL_SCHOOL_FROST
	end
	if holyPower > secondaryPower then
		storedPowers['holy']  = holyPower
		secondaryPowerName = SPELL_SCHOOL_HOLY
	end
	if naturePower > secondaryPower then
		storedPowers['nature']  = naturePower
		secondaryPowerName = SPELL_SCHOOL_NATURE
	end
	if shadowPower > secondaryPower then
		storedPowers['shadow'] = shadowPower
		secondaryPowerName = SPELL_SCHOOL_SHADOW
	end
	
	if(wc3UI_Options.VPlus)then
		spellPower = spellPower + tonumber(math.floor(UnitStat("player",4)*0.33))
	end

	return spellPower, storedPowers, secondaryPowerName, damagePower
end

-- Calculates Healing power
function GetHealingpowerValue()

	local HP_Prefix = "getExtendedData"
	local HP_Tooltip = _G['getExtendedData'] or CreateFrame("GameTooltip", 'getExtendedData', nil, "GameTooltipTemplate")
	HP_Tooltip:SetOwner(WorldFrame, "ANCHOR_NONE")

	local healPower = 0;
	local healPower_Set_Bonus = {}
	local MAX_INVENTORY_SLOTS = 19
	
	for slot=0, MAX_INVENTORY_SLOTS do
		local hasItem = HP_Tooltip:SetInventoryItem("player", slot)
		
		if hasItem then
			local SET_NAME
			
			for line=1, HP_Tooltip:NumLines() do
				local left = getglobal(HP_Prefix .. "TextLeft" .. line)
				
				if left:GetText() then
					local _,_, value = strfind(left:GetText(), "Equip: Increases healing done by spells and effects by up to (%d+).")
					if value then
						healPower = healPower + tonumber(value)
					end
					_,_, value = strfind(left:GetText(), "Healing Spells %+(%d+)")
					if value then
						healPower = healPower + tonumber(value)
					end
					_,_, value = strfind(left:GetText(), "^%+(%d+) Healing Spells")
					if value then
						healPower = healPower + tonumber(value)
					end
					
					_,_, value = strfind(left:GetText(), "(.+) %(%d/%d%)")
					if value then
						SET_NAME = value
					end
					_, _, value = strfind(left:GetText(), "^Set: Increases healing done by spells and effects by up to (%d+)%.")
					if value and SET_NAME and not tContains(healPower_Set_Bonus, SET_NAME) then
						tinsert(healPower_Set_Bonus, SET_NAME)
						healPower = healPower + tonumber(value)
					end
				end
			end
		end
		
	end
	
	-- buffs
	local _, _, healPowerFromAura = GetPlayerAura("Healing done by magical spells is increased by up to (%d+).")
	if healPowerFromAura then
		healPower = healPower + tonumber(healPowerFromAura)
	end
	
	return healPower
end

function InitiateSavedVariables()
	
	if(wc3UI_Options == nil)then
		WIIIUI_ForceReload:Show()

		wc3UI_Options = {}
		wc3UI_Options.hpWarning = 25
		wc3UI_Options.uiScale = 240
		wc3UI_Options.moveChatAreaUp = 10
		wc3UI_Options.xpRestedXpColor = {0, 0, 1, 0.5}
		wc3UI_Options.weaponIconSelected1 = 16
		wc3UI_Options.weaponIconSelected2 = "none"
		wc3UI_Options.weaponIconSelected3 = "none"
		wc3UI_Options.portraitScale = 0
		wc3UI_Options.shapeshiftAuraPos = 2
		wc3UI_Options.castbarAlignmentOption = 190
		wc3UI_Options.PortraitAlignmentX = 100
		wc3UI_Options.PortraitAlignmentY = 100
		wc3UI_Options.HealthPercent = false
		wc3UI_Options.PowerPercent = false
		wc3UI_Options.MultiBarRightHorizontal = false
		wc3UI_Options.MultiBarLeftHorizontal = false

		wc3UI_Options.chatInputAbove = false
		wc3UI_Options.hideGride = false
		wc3UI_Options.hideMicroButtons = true
		wc3UI_Options.hideBagsAboveChatFrame = true
		wc3UI_Options.buffTopRight = true
		wc3UI_Options.HideChatArrows = false
		wc3UI_Options.ZoneTextPos = 1
		wc3UI_Options.StopAnimation = false
		wc3UI_Options.theme = "orc"
	end
	WIIIUI_menuEditboxUIScale:SetText(wc3UI_Options.uiScale)
	WIIIUI_menuEditboxExtendBottomRight:SetText(wc3UI_Options.moveChatAreaUp)
	WIIIUI_menuEditboxPortraitScale:SetText(wc3UI_Options.portraitScale)
	WIIIUI_menuEditboxPortraitHorizontal:SetText(wc3UI_Options.PortraitAlignmentX)
	WIIIUI_menuEditboxPortraitVertical:SetText(wc3UI_Options.PortraitAlignmentY)
	
	xpProgBarMax = wc3UI_Options.uiScale*0.6814

	if wc3UI_Options.ultraWide == nil then
		wc3UI_Options.ultraWide = false
	end

	if wc3UI_Options.rightPartWidth == nil then
		wc3UI_Options.rightPartWidth = wc3UI_Options.uiScale * 2.2 
	end

	if wc3UI_Options.centerSlim == nil then
		wc3UI_Options.centerSlim = false
	end

	if wc3UI_Options.centerSlimNoInv == nil then
		wc3UI_Options.centerSlimNoInv = false
	end


end

function InitiateFrameNames()
	actionbarMainFrame = _G['WIIIUI_alignActionBarFrame']
	-- Left frame parts
	leftFrame = _G['WIIIUI_leftpart']
	minimapFrame = _G['Wc3_UI_minimap']
	portraitFrame = _G['Wc3_UI_portrait']
	noMail = _G['Wc3_UI_minimapNoMail']
	
	-- Custom action buttons
	customActionButton1 = _G['ActionButton_Custom1']
	customActionButton2 = _G['ActionButton_Custom2']
	customActionButton3 = _G['ActionButton_Custom3']

	customActionButton4 = _G['ActionButton_CustomInventory_1']
	customActionButton5 = _G['ActionButton_CustomInventory_2']
	customActionButton6 = _G['ActionButton_CustomInventory_3']
	customActionButton7 = _G['ActionButton_CustomInventory_4']
	customActionButton8 = _G['ActionButton_CustomInventory_5']
	customActionButton9 = _G['ActionButton_CustomInventory_6']

	PortraitBackground = _G['Wc3_UI_portraitBackground']
	PortraitBackgroundMain = _G['WIIIUI_backgroundMain']

	barTextFrame = _G['WIIIUI_texts']
	extension1 = _G['Wc3_UI_extension1']
	extension2 = _G['Wc3_UI_extension2']
	extension3 = _G['Wc3_UI_extension3']
	extensionBackground = _G['Wc3_UI_extensionBackground']

	xpBarMainFrame = _G['Warcaft3_UI_xpFrame']
	xpBarLeft = _G['Wc3_UI_xp1']
	xpBarMiddle = _G['Wc3_UI_xp2']
	xpBarRight = _G['Wc3_UI_xp3']
	xpProgBar = _G['Wc3_UI_xpProgBar']
	xpProgBarRested = _G['Wc3_UI_xpProgBarRested']
	xpCharName = _G['WIIIUI_xpName']
	xpCurrLevel = _G['WIIIUI_xpCurrLevel']
	xpHoverFrame = _G['WIIIUI_xpHoverFrame']

	armorMainFrame = _G['WIIIUI_armorIcon']
	armorIconFrame = _G['Wc3_UI_armorIcon_frame']
	armorIcon = _G['Wc3_UI_armorIcon_tex']
	armorText = _G['WIIIUI_armorText']
	armorValue = _G['WIIIUI_armorValues']

	actionSlotGridMain = _G['WIIIUI_actionslotGrid']
	actionSlotGrid_1 = _G['WIIIUI_actionslotGrid_1']
	actionSlotGrid_2 = _G['WIIIUI_actionslotGrid_2']
	actionSlotGrid_3 = _G['WIIIUI_actionslotGrid_3']
	actionSlotGrid_4 = _G['WIIIUI_actionslotGrid_4']

	rightFrame = _G['WIIIUI_rightpart']
	rightPart_left = _G['Wc3_UI_right_left']
	rightPart_middle = _G['Wc3_UI_right_middle']
end

function InitiateMiniMap()
	Minimap:SetMaskTexture("Interface\\Addons\\WIIIUI\\art\\other\\MinimapMask")
	-- Enable zoom with mouse scroll
	Minimap:EnableMouseWheel(1) 
	Minimap:SetScript("OnMouseWheel", function()
		if(arg1 == -1)then
			if(Minimap:GetZoom() ~= 0)then
				Minimap:SetZoom(Minimap:GetZoom()-1)
			end
		else
			Minimap:SetZoom(Minimap:GetZoom()+1)
		end
	end)
	MinimapCluster:SetParent(UIParent)
	MinimapCluster:Hide()
	MinimapBackdrop:Hide()
end

function AlignUltraWide()

	if(rightPart_middle.centerSlimDone or rightPart_middle.centerSlimNoInvDone)then
		return
	end

	if(wc3UI_Options.centerSlim)then
		WIIIUI_rightpartBackground:Hide()
		Wc3_UI_right_lid:Hide()
		Wc3_UI_bottom_right_top:Hide()
		Wc3_UI_bottom_right_middle:Hide()
		Wc3_UI_bottom_right_bottom:Hide()
		Wc3_UI_right_right_extendedFillerTop_1:Hide()
		Wc3_UI_right_right_extendedFillerTop_2:Hide()
		Wc3_UI_right_right_extendedFillerTop_3:Hide()
		Wc3_UI_right_right_extendedFillerBottom_1:Hide()
		Wc3_UI_right_right_extendedFillerBottom_2:Hide()
		Wc3_UI_right_right_extendedFillerBottom_3:Hide()

	elseif(wc3UI_Options.centerSlimNoInv)then

		WIIIUI_rightpart:Hide()
		if(wc3UI_Options.theme == "nightelf")then
			WIIIUI_leftpart.night_elf_tree = WIIIUI_leftpart:CreateTexture()
			WIIIUI_leftpart.night_elf_tree:SetWidth(wc3UI_Options.uiScale*0.9846153)
			WIIIUI_leftpart.night_elf_tree:SetHeight(wc3UI_Options.uiScale*1.03461538)
			WIIIUI_leftpart.night_elf_tree:SetTexture("Interface\\Addons\\WIIIUI\\art\\"..wc3UI_Options.theme.."\\inventory\\inventory")
			WIIIUI_leftpart.night_elf_tree:SetPoint("BOTTOMLEFT", Wc3_UI_right_left, "BOTTOMLEFT", wc3UI_Options.uiScale*0.1615384, -wc3UI_Options.uiScale*0.02692307)
			WIIIUI_leftpart.night_elf_tree:SetDrawLayer("BACKGROUND")
		end

	end

	local UIParent_right = UIParent:GetRight()
	local right_point =""

	-- We check by frame so it can work with customized UI tool
	if(Wc3_UI_bottom_right_middle:IsVisible())then

		Wc3_UI_bottom_right_top:ClearAllPoints()
		if(wc3UI_Options.theme == "nightelf")then
			Wc3_UI_bottom_right_top:SetPoint("BOTTOMLEFT", WIIIUI_rightpartBackground, "TOPRIGHT", -wc3UI_Options.uiScale*0.9, -wc3UI_Options.uiScale*0.03846153)
		else
			if(wc3UI_Options.theme == "undead")then
				Wc3_UI_bottom_right_top:SetPoint("BOTTOMLEFT", WIIIUI_rightpartBackground, "TOPRIGHT", -wc3UI_Options.uiScale*0.734615, -wc3UI_Options.uiScale*0.03846153)
			else
				Wc3_UI_bottom_right_top:SetPoint("BOTTOMLEFT", WIIIUI_rightpartBackground, "TOPRIGHT", wc3UI_Options.uiScale* -0.725833, -wc3UI_Options.uiScale*0.03846153)
			end
		end
		
		Wc3_UI_bottom_right_bottom:ClearAllPoints()
		Wc3_UI_bottom_right_bottom:SetPoint("BOTTOMLEFT", WIIIUI_rightpartBackground, "BOTTOMRIGHT", wc3UI_Options.uiScale* -0.725833, 0)
	
		Wc3_UI_bottom_right_middle:ClearAllPoints()
		if(wc3UI_Options.theme == "nightelf")then
			Wc3_UI_bottom_right_middle:SetPoint("BOTTOMLEFT", WIIIUI_rightpartBackground, "BOTTOMRIGHT", -37, 0)
		else
			Wc3_UI_bottom_right_middle:SetPoint("BOTTOMLEFT", WIIIUI_rightpartBackground, "BOTTOMRIGHT", wc3UI_Options.uiScale* -0.0625, 0)
		end

		right_point = WIIIUI_rightpartBackground:GetRight()
	
	-- If Inventory part is hidden
	elseif(WIIIUI_rightpart:IsVisible() == nil)then
		
		--Wc3_UI_right_left
		local bg_right_point = Wc3_UI_extensionBackground:GetRight()
		local ui_right = Wc3_UI_right_left:GetRight()

		if(bg_right_point > ui_right)then 
			Wc3_UI_extensionBackground:SetWidth(Wc3_UI_extensionBackground:GetWidth() - (bg_right_point - ui_right))
		end

		right_point = Wc3_UI_right_left:GetRight()
		rightPart_middle.centerSlimNoInvDone = true

		if(wc3UI_Options.theme == "nightelf")then
			right_point = right_point + 18
		end

	-- If Chat part is hidden and not inventory
	elseif(WIIIUI_rightpartBackground:IsVisible() == nil)then

		local pixel = (1/512)
		local remove_width = 0
		
		if(wc3UI_Options.theme == "human")then
			remove_width = (512-209)

		elseif(wc3UI_Options.theme == "orc")then
			remove_width = 512-210

		elseif(wc3UI_Options.theme == "undead")then
			remove_width = 512-221

		elseif(wc3UI_Options.theme == "nightelf")then
			remove_width = 512-254

		else
			remove_width = 302
		end
		
		local base_1 = wc3UI_Options.uiScale*0.0038461
		local base_2 = wc3UI_Options.uiScale*0.00769230
		local base_5 = wc3UI_Options.uiScale*0.0192307
		local base_6 = wc3UI_Options.uiScale*0.023076923
		local base_7 = wc3UI_Options.uiScale*0.0269230
		local nightelf_5 = wc3UI_Options.uiScale*0.0192307
		local undead_7 = wc3UI_Options.uiScale*0.026923

		rightPart_middle:SetTexCoord(0, (1 - pixel*remove_width), 0, 1)
		rightPart_middle:SetWidth((512 - remove_width)/2) -- + 

		if(wc3UI_Options.theme == "nightelf" or wc3UI_Options.theme == "undead")then
			rightPart_middle:SetTexture("Interface\\Addons\\WIIIUI\\art\\"..wc3UI_Options.theme.."\\inventory\\slim")
		end

		local column = 0
		local row = 0
		for inventoryNumber = 1, 6, 1 do

			local inventoryActionSlot = _G['ActionButton_CustomInventory_'..inventoryNumber]
			local inv_width = rightPart_middle:GetWidth()
			local offset_slot = inv_width*0.3714285714
			local slot_size = inv_width*0.28571428 + (
				(wc3UI_Options.theme == "undead" and wc3UI_Options.uiScale >= 245 and wc3UI_Options.uiScale <= 250 and -wc3UI_Options.uiScale*(0.3/110))
				or (wc3UI_Options.theme == "undead" and wc3UI_Options.uiScale < 245 and -wc3UI_Options.uiScale*(0.5/110))
				or (wc3UI_Options.theme == "nightelf" and wc3UI_Options.uiScale < 243 and -wc3UI_Options.uiScale*(4/127))
				or (wc3UI_Options.theme == "nightelf" and wc3UI_Options.uiScale < 250 and -wc3UI_Options.uiScale*(3.5/127))
				or (wc3UI_Options.theme == "nightelf" and -wc3UI_Options.uiScale*(3/127))
				or 0
			)
			local extra_offset_y = (
				( wc3UI_Options.theme == "human" and (wc3UI_Options.uiScale*(1/260)) ) 
				or (wc3UI_Options.theme == "undead" and wc3UI_Options.uiScale*(1/250) )
				or 0
			)
			local extra_offset_x = (
				( wc3UI_Options.theme == "undead" and -wc3UI_Options.uiScale*(3/260) )
				or ( wc3UI_Options.theme == "nightelf" and -wc3UI_Options.uiScale*(8/260) )
				or 0 
			)
			local extra_offset_nightelf_x = (
				( wc3UI_Options.theme == "nightelf" and wc3UI_Options.uiScale < 250 and wc3UI_Options.uiScale*(2/260) )
				or wc3UI_Options.theme == "nightelf" and wc3UI_Options.uiScale*(1/260)
				or 0
			)

			inventoryActionSlot:SetWidth(slot_size)
			inventoryActionSlot:SetHeight(slot_size)
			inventoryActionSlot:ClearAllPoints()
			inventoryActionSlot:SetPoint(
				"BOTTOMLEFT", 
				WIIIUI_inventorySlots, 
				"CENTER", 
				--column* (wc3UI_Options.uiScale*0.156)- (1-column) + (wc3UI_Options.theme == "undead" and 1/inventoryActionSlot:GetWidth() or 0),  
				(column* (offset_slot)) - (1-column) + (extra_offset_x * column) + extra_offset_nightelf_x - (column == 1 and wc3UI_Options.theme == "nightelf" and wc3UI_Options.uiScale < 250 and wc3UI_Options.uiScale*(1/260) or 0),
				row*(wc3UI_Options.uiScale*0.148076) - extra_offset_y - (row == 2 and wc3UI_Options.theme == "undead" and -wc3UI_Options.uiScale*(1/250) or 0 )
			)

			if( math.mod(inventoryNumber, 2) == 1 )then
			
				column = 0
				if(inventoryNumber == 1)then
					column = 1
				end
			else
				column = 1
				row = row + 1
			end
		end

		local bg_right_point = Wc3_UI_extensionBackground:GetRight()
		local ui_left = rightPart_middle:GetLeft()

		Wc3_UI_extensionBackground:SetWidth(Wc3_UI_extensionBackground:GetWidth() - (bg_right_point - ui_left))
		
		right_point = rightPart_middle:GetRight()
		rightPart_middle.centerSlimDone = true
	end

	minimapFrame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", (UIParent_right - right_point)/2, 0)

end

-- WIIIUI_rightpartBackground

function Wc3UI_OnLoad()

	local time, time2

	if( not _G['WIIIUI_dummyFrame'] ) then
		dummyFrame = CreateFrame("Frame", "WIIIUI_dummyFrame", UIParent, nil)
	end

	dummyFrame:RegisterEvent("ADDON_LOADED")
	dummyFrame:RegisterEvent("PLAYER_LOGIN")
	dummyFrame:RegisterEvent("PLAYER_ALIVE")
	dummyFrame:RegisterEvent("UPDATE_BONUS_ACTIONBAR")
	--dummyFrame:RegisterAllEvents()
	dummyFrame:SetScript("OnEvent", function()

		if(arg1 == "WIIIUI") then

			if(event == "ADDON_LOADED")then
				InitiateSavedVariables()
				InitiateFrameNames()
				CreatePlayerPortrait()
				InitiateMiniMap()

				-- Frame pos and size
				AlignMinimap()			-- Bottom left UI, Minimap ½portrait
				AlignPortrait()			-- Bottom left UI, ½portrait info area

				AlignMiddleExtension()	-- Middle UI, extension of grid area
				AlignActionBarUIGrid()	-- Middle UI, Grid area (does not align actionbar, only the GUI)
				AlignRightPart()		-- Right UI, The right part of the UI
				AlignInventorySlots()	-- Align main inventory frame
				
				leftFrame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", minimapFrame:GetWidth()/2 - 1, 0) -- UI is aligned based off this (mostly).

				infoBox = _G['WIIIUI_infoBox']
				infoBox:SetBackdrop( { 
					bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
					edgeFile = "Interface/Tooltips/UI-Tooltip-Border", tile = false, tileSize = 0, edgeSize = 15, 
					insets = { left = 3, right = 3, top = 3, bottom = 3 }
				})
				infoBox:SetBackdropColor(0.1,0.1,0.1,1)
				ChangeTheme()
	
			end
		end

		
		if(event == "PLAYER_LOGIN")then

			UIHideFix()				-- We make a fix to hide some frames that do not want to be hidden by default when pressing alt + z
			ResetPowerBarColor() 	-- We set the power bar color since it bugs and becomes gray before a ui reload.
			AlignHealthMana() 		-- Delay this to later stages, either the proper way or through an update nil?
			AlignBags()
			AlignChatFrames()		-- We change where the input field is and increases the framestrata so it is displayed over our UI
			AlignXPBar()			-- Middle UI, XP bar
			for i=1, 3, 1 do
				AlignWeaponFrame(i)	-- Middle UI, Weapon icons
			end
			AlignArmorFrame()		-- Middle UI, Armor icon
			CheckIfInForm() 		-- Applies form icons on load
			
			CheckHideBags()			-- Check what saved option we got on 'HideBags'
			CheckHideMicro()		-- Check what saved option we got on 'HideMicro'
			CheckHideGride()		-- Check what saved option we got on 'HideGride'
			CheckChatTop()			-- Check what saved option we got on 'CheckChat'
			CheckCastbarOption()	-- Check what saved option we got on 'CastbarAlignment'
			CheckHPThreshold()
			CheckBuffPos()
			CheckChatArrows()
			CheckPortraitAnimationStop()
			CheckHPPercent()
			CheckPowerPercent()
			CheckMultiBarAxis()
			CheckEnableCustomize()
			CheckVPlus()
			CheckUltrawide()
			CheckRightBlackChatPart()
			CheckCenterSlim()
			CheckCenterSlimNoInv()

			InventorySlots()		-- Position our 2x3 inventory slots and edits the frames
			ModifyPlayerPortrait()	-- Changes size and so we get the face camera
			PutHearthstoneInActionBar()	-- Puts the hearthstone into the top actionbar besides the minimap if it is empty
			LowHPWarning()				-- Activates the low hp warning
			HPBarDamageGradiant()		-- Checks current HP and changes the bar color towards red
			CombatTextPortrait()
			EnableChatScroll()
			AlignMinimap()			-- Bottom left UI, Minimap ½portrait
			SwitchMainActionBarEvent()	-- Creates events to check if BonusActionBar is displayed so we can Hide/Show the MainMenuBar buttons
			AlignZoneText()
			ApplyOnDragFunction()
			MultiBarAxis()

			time = 0
			-- We have to delay some frames
			dummyFrame:SetScript("OnUpdate", function()
				time = time + arg1
				if(time > 0.5)then
					AlignBuffFrame()		-- Buff position
					AlignMicroButtons()			-- Micro buttons aligner
					HideMainMenuBarComponents()	-- Hide Frames that we do not want to show from the MainMenuBar.

					AlignActionBars()			-- Align the actionbar grid
					AlignShapeshiftButtons()	-- Aligns the Shapeshift/Aura/Stealth position
					PlaceMiniMapBattleFrame()
					VisibilityChatArrows()
					AlignXPBar()			-- Middle UI, XP bar

					dummyFrame:SetScript("OnUpdate", nil)
					dummyFrame:SetScript("OnEvent", nil)

					time2 = 0
					dummyFrame:SetScript("OnUpdate", function()
						time2 = time2 + arg1
						if(time2 > 0)then
							
							AlignMicroButtons()
							AlignShapeshiftButtons()	
							AlignPlayerIcons()			-- Align the rested, combaet etc icons.
							AlignWeaponFrame(1)
							AlignWeaponFrame(2)
							AlignWeaponFrame(3)

							ChangeCastbarAlignment()	-- Align position of the cast bar, we have to nest the AlignCastBar() for some reason, otherwise the change does not get applied
							InitiateParentFrame()

							AlignTabs()
							HideAllFramesEvent()
							MainMenuBarPerformanceBar:Hide()
							ApplyCustomThemeOptions() -- We must use this last to apply customized positioning, size, transparency etc.
							CustomizationInfo()

							-- fix for texts not showing because scaling change the width which makes it not show properly
							xpCharName:SetHeight(100) -- dirty fix
							xpCharName:SetWidth(WIIIUI_xpHoverFrame:GetWidth()) -- dirty fix
							xpCurrLevel:SetWidth(WIIIUI_xpHoverFrame:GetWidth()) -- dirty fix
							WIIIUI_HealthText:SetWidth(WIIIUI_xpHoverFrame:GetWidth()) -- dirty fix
							WIIIUI_PowerText:SetWidth(WIIIUI_xpHoverFrame:GetWidth()) -- dirty fix

							ChangeRightBlackChatPart()
							if(wc3UI_Options.ultraWide or wc3UI_Options.centerSlim or wc3UI_Options.centerSlimNoInv)then
								AlignUltraWide()
							end

							dummyFrame:SetScript("OnUpdate", nil)
						end
					end)

					dummyFrame:RegisterEvent('UPDATE_WORLD_STATES')
					dummyFrame:RegisterEvent('UPDATE_BONUS_ACTIONBAR') -- used to check if we get a new actionbar from stealth, shapeshift etc
					dummyFrame:RegisterEvent('ACTIONBAR_PAGE_CHANGED') -- used to check if we get a new actionbar from stealth, shapeshift etc
					
					dummyFrame:SetScript("OnEvent", function()
						AlignMicroButtons()
						AlignShapeshiftButtons()
					end)

				end
			end)
		end

	end)

	-- Activate checking for pets
	if( not _G['WIIIUI_dummyPetFrame'] ) then
		dummyPetFrame = CreateFrame("Frame", "WIIIUI_dummyPetFrame", UIParent, nil)
	end
	dummyPetFrame:SetScript("OnEvent", function()

		if(event == "UNIT_PET")then
			if(arg1 == "player")then
				AlignPetFrames()			-- Middle Top UI, aligns pet frame
			end
		end

		if(event == "WORLD_MAP_UPDATE")then 	-- Minimap bug fix, show actionbar when map closes again.
			dummyPetFrame:SetScript("OnUpdate", function()

				AlignShapeshiftButtons()
				MapActionBarFix()
				dummyPetFrame:SetScript("OnUpdate", nil)
			end)
		end

	end)
	dummyPetFrame:RegisterEvent("UNIT_PET")
	dummyPetFrame:RegisterEvent("WORLD_MAP_UPDATE")
end

function UpdateUI(extendNumber)

	
	if(WIIIUI_customizedMainFrame:IsVisible())then
		UpdateCustomThemeSettings()
		ApplyCustomThemeOptions()
	else
		CheckResizeInput()
		CheckPortraitScaleChange()
		CheckExtendInput(extendNumber)
	end
end

function CheckResizeInput()

	local number

	editbox = _G['WIIIUI_menuEditboxUIScale']
	number = tonumber(editbox:GetText())

	if(number == nil)then
		return
	end

	if(number < 240)then
		ChatFrame1:AddMessage("|cffff0000WIIIUI WARNING - Size not supported below 240")
	elseif(number > 270) then
		ChatFrame1:AddMessage("|cffff0000WIIIUI WARNING - Size not supported above 270")
	end

	wc3UI_Options.uiScale = number

	editbox = _G['WIIIUI_menuEditboxPortraitHorizontal']
	number = tonumber(editbox:GetText())
	wc3UI_Options.PortraitAlignmentX = number
	
	editbox = _G['WIIIUI_menuEditboxPortraitVertical']
	number = tonumber(editbox:GetText())
	wc3UI_Options.PortraitAlignmentY = number

	AlignUI()

end

function CheckExtendInput(number)
	
	local number

	editbox = _G['WIIIUI_menuEditboxExtendBottomRight']
	number = tonumber(editbox:GetText())

	if(number == nil)then
		return
	end
	if(number < 0)then
		editbox:SetText(0)
		ChatFrame1:AddMessage("|cffff0000WIIIUI WARNING - ERROR: can not go below 0")
		return
	elseif(number > 150) then
		editbox:SetText(150)
		ChatFrame1:AddMessage("|cffff0000WIIIUI WARNING - ERROR: can not go above 150")
		return
	end
	
	wc3UI_Options.moveChatAreaUp = number
	AlignUI()
end

function CheckHideGride()
	if(wc3UI_Options.hideGride)then
		WIIIUI_menuCheckButton:SetChecked(true)
	else
		WIIIUI_menuCheckButton:SetChecked(false)
	end
end

function CheckPortraitScaleChange()

	local number

	editbox = _G['WIIIUI_menuEditboxPortraitScale']
	number = tonumber(editbox:GetText())

	if(number == nil)then
		return
	end

	if(number < 0)then
		editbox:SetText(0)
		ChatFrame1:AddMessage("|cffff0000WIIIUI WARNING - ERROR: can not go below 0")
		return
	elseif(number > 35) then
		editbox:SetText(35)
		ChatFrame1:AddMessage("|cffff0000WIIIUI WARNING - ERROR: can not go above 35")
		return
	end

	wc3UI_Options.portraitScale = number
	AlignUI()
end

function ChangeHideGride()
	if(WIIIUI_menuCheckButton:GetChecked())then
		wc3UI_Options.hideGride = false
		AlignActionBarUIGrid()
	else
		wc3UI_Options.hideGride = true
		AlignActionBarUIGrid()
	end
end

function CheckHideMicro()
	if(wc3UI_Options.hideMicroButtons)then
		WIIIUI_menuCheckButtonMicro:SetChecked(true)
	else
		WIIIUI_menuCheckButtonMicro:SetChecked(false)
	end
end

function ChangeHideMicro()
	if(WIIIUI_menuCheckButtonMicro:GetChecked())then
		wc3UI_Options.hideMicroButtons = false
	else
		wc3UI_Options.hideMicroButtons = true
	end
	AlignMicroButtons()
end

function ChangeUltrawide()
	if(WIIIUI_Config_UltraWide:GetChecked())then
		wc3UI_Options.ultraWide = false
		ChatFrame1:AddMessage("|cffff0000WIIIUI WARNING - PLEASE RELOAD UI TO APPLY CHANGE")
	else
		wc3UI_Options.ultraWide = true
	end
end

function CheckUltrawide()
	if(wc3UI_Options.ultraWide)then
		WIIIUI_Config_UltraWide:SetChecked(true)
	else
		WIIIUI_Config_UltraWide:SetChecked(false)
	end
end

function ChangeCenterSlim()
	if(WIIIUI_Config_CenterSlim:GetChecked())then
		wc3UI_Options.centerSlim = false
		ChatFrame1:AddMessage("|cffff0000WIIIUI WARNING - PLEASE RELOAD UI TO APPLY CHANGE")
	else
		wc3UI_Options.centerSlim = true
	end
end

function CheckCenterSlim()
	if(wc3UI_Options.centerSlim)then
		WIIIUI_Config_CenterSlim:SetChecked(true)
	else
		WIIIUI_Config_CenterSlim:SetChecked(false)
	end
end

function ChangeCenterSlimNoInv()
	if(WIIIUI_Config_CenterSlimNoInv:GetChecked())then
		wc3UI_Options.centerSlimNoInv = false
		ChatFrame1:AddMessage("|cffff0000WIIIUI WARNING - PLEASE RELOAD UI TO APPLY CHANGE")
	else
		wc3UI_Options.centerSlimNoInv = true
	end
end

function CheckCenterSlimNoInv()
	if(wc3UI_Options.centerSlimNoInv)then
		WIIIUI_Config_CenterSlimNoInv:SetChecked(true)
	else
		WIIIUI_Config_CenterSlimNoInv:SetChecked(false)
	end
end

function UpdateRestedXPColor(color)

	if(color == "purple") then
		wc3UI_Options.xpRestedXpColor = {0.5, 0, 0.5, 0.5}
		xpProgBarRested:SetVertexColor(wc3UI_Options.xpRestedXpColor[1], wc3UI_Options.xpRestedXpColor[2], wc3UI_Options.xpRestedXpColor[3], wc3UI_Options.xpRestedXpColor[4]) -- purple rested 
	elseif(color == "blue") then
		wc3UI_Options.xpRestedXpColor = {0, 0, 1, 0.5}
		xpProgBarRested:SetVertexColor(wc3UI_Options.xpRestedXpColor[1], wc3UI_Options.xpRestedXpColor[2], wc3UI_Options.xpRestedXpColor[3], wc3UI_Options.xpRestedXpColor[4]) -- blue rested 
	elseif(color == "none") then
		wc3UI_Options.xpRestedXpColor = {0, 0, 0, 0}
		xpProgBarRested:SetVertexColor(wc3UI_Options.xpRestedXpColor[1], wc3UI_Options.xpRestedXpColor[2], wc3UI_Options.xpRestedXpColor[3], wc3UI_Options.xpRestedXpColor[4]) -- No rested 
	elseif(color == "custom") then
		xpProgBarRested:SetVertexColor(wc3UI_Options.xpRestedXpColor[1], wc3UI_Options.xpRestedXpColor[2], wc3UI_Options.xpRestedXpColor[3], wc3UI_Options.xpRestedXpColor[4]) -- No rested 
	end
	AlignXPBar()

end

function CustomColorPicker()

	function ShowColorPicker(r, g, b, a, changedCallback)
		ColorPickerFrame.hasOpacity, ColorPickerFrame.opacity = (a ~= nil), a;
		ColorPickerFrame.previousValues = {r,g,b,a};
		ColorPickerFrame.func, ColorPickerFrame.opacityFunc, ColorPickerFrame.cancelFunc = changedCallback, changedCallback, changedCallback;
		ColorPickerFrame:SetColorRGB(r,g,b,a);
		ColorPickerFrame:Hide(); -- Need to run the OnShow handler.
		ColorPickerFrame:Show();
	end

	ColorPickerFrame:Show()
	ColorPickerFrame:SetFrameStrata("DIALOG")

	local function myColorCallback(restore)
		local newR, newG, newB, newA;
		if restore then
		 -- The user bailed, we extract the old color from the table created by ShowColorPicker.
		 newR, newG, newB, newA = unpack(restore);
		else
		 -- Something changed
		 newA, newR, newG, newB = OpacitySliderFrame:GetValue(), ColorPickerFrame:GetColorRGB();
		end
		
		-- Update our internal storage.
		r, g, b, a = newR, newG, newB, newA;
		
		-- And update any UI elements that use this color...
		xpProgBarRested:SetVertexColor(r, g, b, a) -- No rested 
		wc3UI_Options.xpRestedXpColor = {r, g, b, a}
		UpdateRestedXPColor("custom")
	end
	r, g, b, a = wc3UI_Options.xpRestedXpColor[1], wc3UI_Options.xpRestedXpColor[2], wc3UI_Options.xpRestedXpColor[3], wc3UI_Options.xpRestedXpColor[4]
	ShowColorPicker(r, g, b, a, myColorCallback);
end

function ChangeWeaponIcon(type, iconNumber)

	local icon, weaponIconNumber

	if(type == "main") then
		icon = GetInventoryItemTexture("player", 16)
		weaponIconNumber = 16
	elseif(type == "offhand")then
		icon = GetInventoryItemTexture("player", 17)
		weaponIconNumber = 17
	elseif(type == "ranged")then
		icon = GetInventoryItemTexture("player", 18)
		weaponIconNumber = 18
	elseif(type == "ammo")then
		icon = GetInventoryItemTexture("player", 0)
		weaponIconNumber = 0
	elseif(type == "spell")then
		icon = "Interface\\Icons\\INV_Staff_07"
		weaponIconNumber = 99
	elseif(type == "heal")then
		icon = "Interface\\Icons\\Spell_Holy_Heal"
		weaponIconNumber = 98
	elseif(type == "none")then
		weaponIconNumber = "none"
	end
	weaponIcon = _G['Wc3_UI_weaponIcon_tex_'..iconNumber]
	weaponIcon:SetBackdrop({
		bgFile = (icon or "Interface\\AddOns\\WIIIUI\\art\\other\\fist" )
	})
	if(iconNumber == 1)then
		wc3UI_Options.weaponIconSelected1 = weaponIconNumber
	elseif(iconNumber == 2)then
		wc3UI_Options.weaponIconSelected2 = weaponIconNumber
	elseif(iconNumber == 3)then
		wc3UI_Options.weaponIconSelected3 = weaponIconNumber
	end
	AlignWeaponFrame(iconNumber)
end

function ChangeHideBags()
	if(WIIIUI_menuCheckButtonBags:GetChecked())then
		wc3UI_Options.hideBagsAboveChatFrame = false
	else
		wc3UI_Options.hideBagsAboveChatFrame = true
	end
	AlignBags()
end

function CheckHideBags()	
	if(wc3UI_Options.hideBagsAboveChatFrame)then
		WIIIUI_menuCheckButtonBags:SetChecked(true)
	else
		WIIIUI_menuCheckButtonBags:SetChecked(false)
	end
end

function ChangeChatTop()
	if(WIIIUI_menuChatAtTop:GetChecked())then
		wc3UI_Options.chatInputAbove = false
	else
		wc3UI_Options.chatInputAbove = true
	end
	AlignChatFrames()
end

function CheckChatTop()	
	if(wc3UI_Options.chatInputAbove)then
		WIIIUI_menuChatAtTop:SetChecked(true)
	else
		WIIIUI_menuChatAtTop:SetChecked(false)
	end
end

function ChangeShapeshiftButtonsPos()

	if(wc3UI_Options.shapeshiftAuraPos ~= 5)then
		wc3UI_Options.shapeshiftAuraPos = wc3UI_Options.shapeshiftAuraPos + 1
	else
		wc3UI_Options.shapeshiftAuraPos = 1
	end
	AlignShapeshiftButtons()
end

function ChangeCastbarAlignment()

	local number

	editbox = _G['WIIIUI_menuEditboxCastbarAlignment']
	number = tonumber(editbox:GetText())

	wc3UI_Options.castbarAlignmentOption = number
	AlignCastBar()
end

function CheckCastbarOption()

	local editbox = _G['WIIIUI_menuEditboxCastbarAlignment']
	editbox:SetText(wc3UI_Options.castbarAlignmentOption)
end

function ChangeHPThreshold()
	local editbox = _G['WIIIUI_menuEditboxHPThreshold']
	local number = tonumber(editbox:GetText())
	wc3UI_Options.hpWarning= number
	LowHPWarning()
end

function CheckHPThreshold()
	local editbox = _G['WIIIUI_menuEditboxHPThreshold']
	editbox:SetText(wc3UI_Options.hpWarning)
end

function ChangeBuffPos()

	if(WIIIUI_menuCheckButtonBuff:GetChecked())then
		wc3UI_Options.buffTopRight = false
	else
		wc3UI_Options.buffTopRight = true
	end
	ReAlignBuffFrame()

end

function CheckBuffPos()	

	if(wc3UI_Options.buffTopRight)then
		WIIIUI_menuCheckButtonBuff:SetChecked(true)
	else
		WIIIUI_menuCheckButtonBuff:SetChecked(false)
	end
end

function ChangeHideChatArrows()

	if(wc3UI_Options.HideChatArrows == nil)then
		wc3UI_Options.HideChatArrows = true
	elseif(wc3UI_Options.HideChatArrows)then
		wc3UI_Options.HideChatArrows = false
		ChatFrame1:AddMessage("|cffff0000WIIIUI WARNING - PLEASE RELOAD UI TO DISPLAY CHAT ICONS")
	else
		wc3UI_Options.HideChatArrows = true
	end
	VisibilityChatArrows()
end

function CheckChatArrows()	

	if(wc3UI_Options.HideChatArrows)then
		WIIIUI_menuCheckChatArrows:SetChecked(true)
	else
		WIIIUI_menuCheckChatArrows:SetChecked(false)
	end
end

function ChangeZoneTextButtonsPos()

	if(wc3UI_Options.ZoneTextPos == nil)then
		wc3UI_Options.ZoneTextPos = 1
	else
		wc3UI_Options.ZoneTextPos = wc3UI_Options.ZoneTextPos + 1

		if(wc3UI_Options.ZoneTextPos > 3)then
			wc3UI_Options.ZoneTextPos = 1
		end

	end
	AlignZoneText()
end

function ChangePortraitAnimationStop()

	if(wc3UI_Options.StopAnimation == nil)then
		wc3UI_Options.StopAnimation = false
	else
		
		if(wc3UI_Options.StopAnimation)then
			wc3UI_Options.StopAnimation = false
		else
			wc3UI_Options.StopAnimation = true
		end

	end
	ModifyPlayerPortrait()
end

function CheckPortraitAnimationStop()	

	if(wc3UI_Options.StopAnimation)then
		WIIIUI_menuCheckButtonPortraitStop:SetChecked(true)
	else
		WIIIUI_menuCheckButtonPortraitStop:SetChecked(false)
	end
end

function ChangeHPPercent()

	if(wc3UI_Options.HealthPercent == nil)then
		wc3UI_Options.HealthPercent = false
	else
		
		if(wc3UI_Options.HealthPercent)then
			wc3UI_Options.HealthPercent = false
		else
			wc3UI_Options.HealthPercent = true
		end

	end
	AlignHealthMana()
end

function CheckHPPercent()

	if(wc3UI_Options.HealthPercent)then
		WIIIUI_menuCheckHPPercent:SetChecked(true)
	else
		WIIIUI_menuCheckHPPercent:SetChecked(false)
	end
end

function ChangePowerPercent()

	if(wc3UI_Options.PowerPercent == nil)then
		wc3UI_Options.PowerPercent = false
	else
		
		if(wc3UI_Options.PowerPercent)then
			wc3UI_Options.PowerPercent = false
		else
			wc3UI_Options.PowerPercent = true
		end

	end
	AlignHealthMana()
end

function CheckPowerPercent()

	if(wc3UI_Options.PowerPercent)then
		WIIIUI_menuCheckPowerPercent:SetChecked(true)
	else
		WIIIUI_menuCheckPowerPercent:SetChecked(false)
	end
end

function HideThemeButtons()

	local themeButtons = {
		"WIIIUI_menuButtonThemeHuman",
		"WIIIUI_menuButtonThemeOrc",
		"WIIIUI_menuButtonThemeUndead",
		"WIIIUI_menuButtonThemeNightElf",
		"WIIIUI_menuButtonThemeCustom1",
		"WIIIUI_menuButtonThemeCustom2",
		"WIIIUI_menuButtonThemeCustom3",
		"WIIIUI_menuButtonThemeCustom4",
		"WIIIUI_menuButtonThemeCustom5",
		"WIIIUI_menuButtonThemeCustom6",
		"WIIIUI_menuButtonThemeCustom7",
		"WIIIUI_menuButtonThemeCustom8"
	}

	for k,v in pairs(themeButtons) do
		_G[v]:Hide()
	end

end

function ChangeEnableCustomize()

	if(wc3UI_Options.EnableCustomize)then
		wc3UI_Options.EnableCustomize = false
		WIIIUI_menuEnableCustomizeDisabledText:SetText("You have to reload UI to enable change of theme.")
		ChatFrame1:AddMessage("|cffff0000WIIIUI WARNING - PLEASE RELOAD UI TO COMPLETE THE CHANGES")
	else
		wc3UI_Options.EnableCustomize = true
		WIIIUI_menuEnableCustomizeDisabledText:Show()
		HideThemeButtons()
		CreateCustomizedFrames()
		ApplyCustomThemeOptions()
	end
end

function CheckEnableCustomize()

	if(wc3UI_Options.EnableCustomize == nil)then
		wc3UI_Options.EnableCustomize = false
	end

	if(wc3UI_Options.EnableCustomize)then
		WIIIUI_menuCheckButtonEnableCustomize:SetChecked(true)
		WIIIUI_menuEnableCustomizeDisabledText:Show()
		HideThemeButtons()
	else
		WIIIUI_menuCheckButtonEnableCustomize:SetChecked(false)
		WIIIUI_menuEnableCustomizeDisabledText:Hide()
	end
end

function ChangeMultiBarAxis(multibar)

	if(wc3UI_Options.MultiBarLeftHorizontal == nil)then
		wc3UI_Options.MultiBarLeftHorizontal = false
	end

	if(wc3UI_Options.MultiBarRightHorizontal == nil)then
		wc3UI_Options.MultiBarRightHorizontal = false
	end

	if(multibar == "left")then

		if(wc3UI_Options.MultiBarLeftHorizontal)then
			wc3UI_Options.MultiBarLeftHorizontal = false
			ChatFrame1:AddMessage("|cffff0000WIIIUI WARNING - PLEASE RELOAD UI TO APPLY CHANGE")
		else
			wc3UI_Options.MultiBarLeftHorizontal = true
		end

	elseif(multibar == "right")then
		
		if(wc3UI_Options.MultiBarRightHorizontal)then
			wc3UI_Options.MultiBarRightHorizontal = false
			ChatFrame1:AddMessage("|cffff0000WIIIUI WARNING - PLEASE RELOAD UI TO APPLY CHANGE")
		else
			wc3UI_Options.MultiBarRightHorizontal = true
		end
	end
	
	MultiBarAxis()
end

function CheckMultiBarAxis()
	if(wc3UI_Options.MultiBarLeftHorizontal)then
		WIIIUI_menuCheckMultibarLeftHorizontal:SetChecked(true)
	else
		WIIIUI_menuCheckMultibarLeftHorizontal:SetChecked(false)
	end

	if(wc3UI_Options.MultiBarRightHorizontal)then
		WIIIUI_menuCheckMultibarRightHorizontal:SetChecked(true)
	else
		WIIIUI_menuCheckMultibarRightHorizontal:SetChecked(false)
	end
end

function ChangeVPlus()

	if(wc3UI_Options.VPlus == nil)then
		wc3UI_Options.VPlus = false
	else
		
		if(wc3UI_Options.VPlus)then
			wc3UI_Options.VPlus = false
		else
			wc3UI_Options.VPlus = true
			ChatFrame1:AddMessage("|cffff0000WIIIUI WARNING - PLEASE RELOAD UI TO UPDATE SPELLPOWER SCALING")
		end

	end
end

function CheckVPlus()	

	if(wc3UI_Options.VPlus == nil)then
		wc3UI_Options.VPlus = false
	end

	if(wc3UI_Options.VPlus)then
		WIIIUI_menuCheckButtonVPlus:SetChecked(true)
	else
		WIIIUI_menuCheckButtonVPlus:SetChecked(false)
	end
end

function ChangeRightBlackChatPart()

	local number

	editbox = _G['WIIIUI_Config_RightPartWidth']
	number = tonumber(editbox:GetText())

	wc3UI_Options.rightPartWidth  = number
	WIIIUI_rightpartBackground:SetWidth(number)

	if(wc3UI_Options.ultraWide)then
		AlignUltraWide()
	end

end

function CheckRightBlackChatPart()

	local editbox = _G['WIIIUI_Config_RightPartWidth']
	editbox:SetText( math.floor(tonumber(wc3UI_Options.rightPartWidth)) )
end
