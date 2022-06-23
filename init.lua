local storage = minetest.get_mod_storage()

local latest_welcome_version = 1

local hypertext_text = [[
<center><big>Welcome to <b>The Minecraftn't Classic Server</b>!</big></center>

<b>-</b>

This is a server that aims to recreate Minecraft Classic, and work upon that by implementing features from the Classic Protocol Extension, custom multiplayer server software, and even more!
Build something cool and have a great time around here.

<big>Rules</big>
<img name=blank.png width=32 height=1>1. <b>No griefing.</b> We have rollback functionality in place which can revert any griefing instantly, you're just wasting your time.
<img name=blank.png width=32 height=1>2. <b>No tunneling or pillaring.</b> It's unnecessary and makes the map look ugly. You are already given the permission to fly, rather than pillaring up to get somewhere.
<img name=blank.png width=32 height=1>3. <b>Be mindful of others.</b> Both in chat and in-game. Do not needlessly mess with other people's builds or be an ass in the chat.
<img name=blank.png width=32 height=1>4. <b>Staff decisions are final.</b> They may act in any way they see fit to keep the server a pleasant experience for everyone.]]

local formspec_text = "formspec_version[4]"
	.."size[14,11]"
	.."box[0.25,0.25;13.5,9.5;#00000088]"
	.."hypertext[0.5,0.5;13,9;welcometext;"..hypertext_text.."]"
	.."button[4.5,9.9;5,0.9;btn_confirm;OK, I agree to the rules]"

minetest.register_on_joinplayer(function(player, last_login)
	local playername = player:get_player_name()
	if storage:get_int(playername) < latest_welcome_version then
		storage:set_int(playername, latest_welcome_version)
		minetest.show_formspec(playername, 'mccnt_server:welcomescreen', formspec_text)
	end
end)
