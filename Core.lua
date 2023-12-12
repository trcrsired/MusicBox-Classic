local MusicBox = LibStub("AceAddon-3.0"):GetAddon("MusicBox")
local GetInstanceInfo = GetInstanceInfo
local IsResting = IsResting
local UnitIsGhost = UnitIsGhost
--------------------------------------------------------------------------------------

function MusicBox:PlayMainlineMusic()
	local mainline_music = self.db.profile.mainline_music
	if mainline_music then
		local mainlinefunction = MusicBox.mainlinefunction
		if mainlinefunction == nil then
			LoadAddOn("MusicBox_MainlineMusic")
			mainlinefunction = MusicBox.mainlinefunction
		end
		if mainlinefunction then
			if mainlinefunction() then
				return
			end
		end
	end
end

function MusicBox:UpdateWorld(pt)
	local profile = self.db.profile
	local playlist = profile[pt]
	if playlist then
		self:PlayPlaylist(self:GetPlaylist(playlist))
	else
		if not UnitIsGhost("player") then
			self:PlayMainlineMusic()
		end
		self:Stop()
	end
end

function MusicBox:OnEnable()
	if self.db.profile.game_music then
		LoadAddOn("MusicBox_GameMusic")
	end
	self:Stop()
	self:UpdateWorld(self:GetProfileType())
	self:RegisterEvent("LOADING_SCREEN_DISABLED")
	self:RegisterEvent("PLAYER_UNGHOST","PlayMainlineMusic")
	C_Timer.After(2.0,function() MusicBox:PLAYER_UPDATE_RESTING() end)
end

function MusicBox:GetInstanceType()
	if IsResting() then
		return "rest"
	end
	local _,v = GetInstanceInfo()
	return v;
end

function MusicBox:GetProfileType()
	local profile = self.db.profile
	local instance = self:GetInstanceType()
	if instance ~= "none" and profile["enable_"..instance] then
		return instance;
	end
	return "none"
end
function MusicBox:SetPlaylistNameInstance(t,pname)
	self.db.profile[t] = pname
	if t == self:GetProfileType() then
		self:UpdateWorld(t)
	end
end
function MusicBox:GetPlaylistNameInstance(t)
	return self.db.profile[t]
end

function MusicBox:AddPlaylist(pname,pt)
	self.db.profile.playlists[pname] = pt
end
function MusicBox:AddTempPlaylist(pname,pt)
	self.temp_playlist[pname] = pt
	if self.db.profile.game_music_use_path then
		local tconcat = table.concat
		for i=1,#pt do
			local pti = pt[i]
			local pti3 = pti[3]
			if pti3 then
				pti[4] = pname
			end
		end
	end
end
function MusicBox:GetPlaylist(pname)
	local pl = self.db.profile.playlists[pname]
	if pl then
		return pl
	else
		return self.temp_playlist[pname]
	end
end
function MusicBox:RemovePlaylist(pname)
	self.db.profile.playlists[pname] = nil
end

function MusicBox:PLAYER_UPDATE_RESTING()
	self:UpdateWorld(self:GetProfileType())
end
function MusicBox:LOADING_SCREEN_DISABLED()
	self:Stop()
	self:UpdateWorld(self:GetProfileType())
end
