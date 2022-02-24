![WIIIUI_cover_text_2](https://user-images.githubusercontent.com/97316608/149594045-c5f69b42-0634-4792-a9a6-820b3527971b.png)


# WIIIUI
**WIIIUI** was made for Warcraft III fans or people who just enjoy the aesthetics.  

This addon have the four faction themes from Warcraft III, Human, Orc, Undead and Night Elf. The addon also have the possibility to add your own theme albeit it does not have good support for it with the initial release. 
It also offers various feature that can be read below and instruction on how to modify the addon.

A video demonstrating the different menu options available.  
https://youtu.be/agffQHWyWh8

Please give feedback for improvements or new features for future releases.  
Don't forget to check out [Known issues](https://github.com/Fiurs-Hearth/WarcraftIII-UI_master#known-issues) section.  

Contact me on Discord: Fiur#8658

## Installation
* [Download the addon](https://github.com/Fiurs-Hearth/WIIIUI/archive/refs/heads/master.zip)
* Unpack the file
* Open the unpacked file and rename the folder named `WIIIUI-master` to `WIIIUI`
* Put the renamed folder into the AddOns folder: `World of Warcraft\Interface\AddOns`
* Start or restart WoW if already running 
* Recommended: [Set script memory to 0](https://imgur.com/a/V65UiKd), this helps against most game crashes caused by addons, click link for instructions.

Download MoveAnything addon [here](https://legacy-wow.com/vanilla-addons/MoveAnything/).  
*With this addon you can move basically any UI part that was not added by addons (such as mine)*

### Don't forgot to open the config menu for configuration options, accessible in the lower right corner!

![cog_pos](https://user-images.githubusercontent.com/97316608/148687659-82e5ddfa-b4a4-412d-a739-0f3123ebffe6.png)


## Please support
[Click here to donate via ko-fi](https://ko-fi.com/fiur_)  
[Click here to donate via PayPal](https://www.paypal.com/paypalme/FiurBusiness)  

#### Crypto
ETH: 0x51086260a62ceAD7f3A930708a50ad2F3d36eB08  
BTC: bc1qqzrnnw3nnn9m7plsmwp8e9jhzkvqjc42kg4dym  
BNB: bnb1m5rau82ydfvcualt7hf54h2yvsfumj3sv7g2t7  
  
If you have other crypto you want to donate with, please contact me at Discord: Fiur#8658

## Themes
### Human Theme
![Human_theme](https://user-images.githubusercontent.com/97316608/149590970-9f816046-1437-49f3-a054-57f0091d1da6.png)


### Orc Theme
![Orc_theme](https://user-images.githubusercontent.com/97316608/149590980-62941102-2bcf-4d16-b171-d282a12b2785.png)


### Undead Theme
![Undead_theme](https://user-images.githubusercontent.com/97316608/149590984-d022bb4e-a535-4fcb-a750-44d649bb1022.png)


### Night Elf Theme
![Night_elf_theme](https://user-images.githubusercontent.com/97316608/149590975-f7f840c8-c469-4cee-89cb-270efd60a959.png)  
(Screenshots taken on server [Turtle WoW](https://turtle-wow.org/))

## Features
* (NEW!) Customization tab, allows you to edit size, position, transparency, texture, stacking etc. Use mouse scroll to change page.
  
![image](https://user-images.githubusercontent.com/97316608/153955704-44634062-df14-4ce3-b992-82f4ad7fb400.png)  

Example of an edit with human theme:  

![image](https://user-images.githubusercontent.com/97316608/153957920-623ca862-9a94-4cbd-a770-2976fe6b324c.png)  
  
#### Settings:  
Page 8, extensionBackground, width: 500 (change to fit)  
Page 22, rightpart, Frame strata: BACKGROUND  
inventorySlots, Hide: Checked  
  
* Zoom minimap in and out with the mousescroll while hovering over the minimap
* Scroll chat up or down with mousescroll while hovering over the chat
* 3 extra custom bindable actionslots next to the minimap, hearthstone is automatically put into the top one if it's empty

![minimap_empty_filled](https://user-images.githubusercontent.com/97316608/148685189-52fcec77-3a74-41d5-9656-ca19863fb7a1.png)

* 6 extra custom bindable actionslots where you can put spells, items, consumables etc.

![InventorySlots](https://user-images.githubusercontent.com/97316608/148687365-64b098b1-96ce-4e82-a3b1-f4ba88ef45f0.png)

![custom_keys](https://user-images.githubusercontent.com/97316608/148855451-dfd5cd3d-afca-4cb4-bfb0-81b6cea93f2a.png)


* Customizable icons to show different kind of information.

![Icons_information](https://user-images.githubusercontent.com/97316608/148687081-e8bdebd4-f714-498a-8e26-6feb9a802d23.png)

* A configuration menu, accessible in the lower right corner by hovering your mouse in the corner

#### Cog wheel
![cog_pos](https://user-images.githubusercontent.com/97316608/148687659-82e5ddfa-b4a4-412d-a739-0f3123ebffe6.png)

#### Configuration menu
![Config_Menu](https://user-images.githubusercontent.com/97316608/148777057-e33029d7-cafc-4805-beb9-5ba9e40ad7e4.png)  
A video demonstrating the different menu options available.  
https://youtu.be/agffQHWyWh8

## Custom Themes

The customization feature takes current settings of current theme and saves it as a base setting.
Since it takes current settings and uses that as a base, some frames are set as hidden as base and needs to be unchecked to become visible (for example custom action slots).

### Tips, Tricks and Solutions

- **WARNING, this will remove your saved settings for your customized themes!!!** You can reset the base settings by deleting the WIIIUI.lua file in `WoW\WTF\Account\[ACCOUNT NAME]\[SERVER NAME]\[CHARACTER NAME]\SavedVariables` or by opening the file and remove the `base_settings` of the theme, do the same with the theme in `edit_theme_settings`.
- Some frames are hidden or visible based on the UI scale and might be hidden based on your UI scale, just uncheck the Hide checkbox and it will appear.
- Changes are not being applied? Enable customize settings from the config menu.
- Inventory (custom action) slots are not visible, uncheck hide for each action slot you want to be visible.
- Changing the UI scale from the General tab screws with my UI. Reload UI.
- Name over the experience bar does not fit? Increase the width of `WIIIUI_xpName` on Page 14.
- Level and class text does not fit?  Increase the width of `WIIIUI_xpName` on Page 14.
- HP and/or Mana/Rage/Energy does not fit? Increase the width of `WIIIUI_HealthText` and `WIIIUI_PowerText` on Page 41.
- Changing position of either Pos X or Pos Y does not work? If `Point` and `Relative to` are both or either is set to CENTER, try changing it to BOTTOMLEFT on `Point` and BOTTOMRIGHT on `Relative to`, requires you to reload UI. Other settings might work as well, if the frame disappears after this change it might be outside of the screen and you may have to put in negative value on Pos X or Pos Y.
  
#### Here are some example edits.
   
![image](https://user-images.githubusercontent.com/97316608/154354056-2f22bd87-45c0-4e0a-bbc3-24386153ee69.png)  
Centered with space on sides (Useful for ultra wide screens)  
For above solution you want to:
1. (Optional) Edit the UI scale in the General tab.
2. Go to page 9,  `WIIIUI_leftpart`, Pos X, if you are running wide screen and not ultra wide then remember how much you increase this with so you can apply the same value to the parts on the right side of the UI.
3. Go to page 22, `WIIIUI_rightpartBackground`, change Point to BOTTOMLEFT and change the Pos X value, reload UI after edit if nothing happens otherwise it wont display properly while editing. Now change it again and try changing width as well if needed, you might have to come back to this one.
4. Go to page 23, `Wc3_UI_bottom_right_top`, change Pos X value
5. Go to page 24, `Wc3_UI_bottom_right_middle`, change Pos X value
6. Go to page 24, `Wc3_UI_bottom_right_bottom`, change Pos X value
7. Go to page 24-25, `Wc3_UI_right_right_extendedFillerBottom_1` (and ...extendedFillerBottom_2 and ...extendedFillerBottom_3) , change Pos X value if needed

![image](https://user-images.githubusercontent.com/97316608/154283280-134b61f1-69dd-4947-9343-60b7f7959dbd.png)  
No chatframe area  
For above solution you want to:
1. Go to page 22, check Hide for `WIIIUI_rightpart`.
2. Go to page 8 and change `Wc3_UI_extensionsBackground`'s width.
3. Go to page 9 and change `WIIIUI_leftpart`'s Pos X.

![image](https://user-images.githubusercontent.com/97316608/154311175-3a032b69-6757-40a8-aa4c-97cf303bfb4b.png)  
No inventory slots    
For above solution you want to:
1. Go to page 11, `Wc3_UI_right_left`, set it's Parent to `WIIIUI_rightpart` and Draw layer to OVERLAY.
2. Go to page 22, `WIIIUI_inventorySlots`, check Hide if you want to hide the 6 action slots
3. Go to page 23, `Wc3_UI_right_middle`, set Draw layer to ARTWORK

### How to make a custom theme

- Create a folder named `custom#` 1-8, example `custom4`.
- Copy all files and folders in `WoW\Interface\AddOns\WIIIUI\art\orc` and paste it into your new folder. Orc is the template for custom themes, which is good if you do not intend to edit with the customization option.
- Either use the images as a template and follow their form or go crazy and use the customization feature.
- Do not save any image with higher resolution than 512x512 since it is not supported in vanilla WoW.
- All images must be saved with width/height of a multiplier of 8. For example: 16,32,64,128,256,512.
- You can edit and then save an image while ingame, you just need to reload the UI to see the changes ingame.

### How to apply custom themes

- Download a theme
- Put the custom theme folder into `WoW\Interface\AddOns\WIIIUI\art`
- (Optional) Go into `WoW\WTF\Account\[ACCOUNT NAME]\[SERVER NAME]\[CHARACTER NAME]\SavedVariables`
- (Optional) Paste the WIIIUI.lua file and overwrite OR...
- (Optional) If you don't want your old settings to be overriden, such as UI scale size etc, then you can go into the downloaded WIIIUI.lua file, copy the code block in `["base_settings"]={["THEME"]}`, paste it into your own WIIIUI.lua file. Now do the same with `["edit_theme_settings"]={["THEME"]}`.  
  
![image](https://user-images.githubusercontent.com/97316608/154137716-eaa9c73b-e2d3-44b6-b700-59041f45d84b.png)  
Example of how it should look.

#### How to share 

- Upload your custom theme folder from `WoW\Interface\AddOns\WIIIUI\art`.
- (Optional) Upload your `WoW\WTF\Account\[ACCOUNT NAME]\[SERVER NAME]\[CHARACTER NAME]\SavedVariables\WIIIUI.lua` file.
- (Optional) Or share the code block in `["base_settings"]={["THEME"]}` and the same with `["edit_theme_settings"]={["THEME"]}`.  
- Ask me to add your theme to the list of custom themes or share it as you please.

### Player made Custom themes

#### nobrains21's themes  

Queensland UI  
https://github.com/nobrains21/WIIIUI-QueenslandUI  

![image](https://user-images.githubusercontent.com/97316608/154486374-89611645-4bf5-40ea-b49c-d44eb1afcdad.png)  

---

NerubUI    
https://github.com/nobrains21/WIIIUI-NerubUI  

![image](https://user-images.githubusercontent.com/97316608/154486852-b0994114-b04f-4609-bb94-8026f4d7153a.png)  

---

Void UI  
https://github.com/nobrains21/WIIIUI-VoidUI  

![image](https://user-images.githubusercontent.com/97316608/154486891-0eadd308-ad61-469c-9980-d47f9062efe8.png)  

---
  
#### Jirry's themes  
  
High Elf UI  
https://www.mediafire.com/file/l7npfxg7oaniq2w/HighelfUI.rar/file  

![highelfscreen](https://user-images.githubusercontent.com/97316608/155598181-4d1c74e2-29f8-4372-a309-4f4995c0866d.png)  

---

Blood Elf UI  
https://www.mediafire.com/file/ibkifm95o6vl1ab/BloodelfUI.rar/file  

![bloodelfscreen](https://user-images.githubusercontent.com/97316608/155598569-2d4ceb48-6456-4247-81b2-f3e34684ab16.png)  

---

Gnome UI  
https://www.mediafire.com/file/gxixndwtmmxs03l/GnomeUI.rar/file  

![gnomescreen](https://user-images.githubusercontent.com/97316608/155598651-c65981bd-b574-41a2-a865-48689464e7a3.png)  

---

Goblin UI  
https://www.mediafire.com/file/m3xh9rulsjp4mza/GoblinUI.rar/file  

![goblinscreen](https://user-images.githubusercontent.com/97316608/155598722-40a8745d-6921-486a-95b2-c22664b2cdba.png)  

---

Tauren UI  
https://www.mediafire.com/file/x8bv3xbspxc6u2l/TaurenUI.rar/file  

![taurenscreen](https://user-images.githubusercontent.com/97316608/155619995-131f687b-0603-4b2e-84e4-7dd2c7a08315.png)  

---

## FAQ
**Q:** How do I move or change size of the chat window?  
  
**A:** Check image below and follow these instructions:  
  * To move the chat window, move mouse cursor to the location of the red square #1, after a second the 'General' tab will be displayed.
  * Right click while mouse is on 'General' tab, move to the red square #2 and click 'Unlock Window'.
  * Move mouse curosr to the red square #1, hold left click, drag and let go when you have found a position you like.
  * To change the size of the chat window, make sure the chat window is unlocked, move mouse cursor to any edge (highlighted in blue in image below) of the chat window, hold left click, drag and release when you have found a size you enjoy.
  
![image](https://user-images.githubusercontent.com/97316608/153941630-09fc3f3f-13f9-4833-994c-865a76688421.png)
  
## Known issues
* The UI looks wrong? Try reloading the UI from the config menu, if that doesn't work, hit Escape to open the game's Main Menu, click 'Video Options' and either uncheck 'Use UI Scale' if it's checked or
* Options not saving is likely because your files are set to 'Read only', please look up how to remove 'Read only' as it is different depending on your OS.
* When adding something to an empty minimap actionslot the icon is enlarged, please reload UI from config menu.
* When adding something to an empty extra inventory slot the icon is enlarged, please pick it up with left mouse click and put it back or reload UI.
* When adding something to an empty actionslot in the actiongrid the icon is enlarged, please pick it up with left mouse click and put it back or reload UI.
* Undead male's animated portrait looks bugged, a fault caused by Blizzard and not the addon, this is the reason why I added the menu option to disable portrait animation.
* If other issues arrive, try to note down what you did to create this issue and please contact me at Fiur#8648, in the meantime please reload UI. 
