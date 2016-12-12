
----------------------------------------------------
--Preferences
----------------------------------------------------

local preferences = renoise.Document.create("ScriptingToolPreferences") {
  enabled = false,
}

renoise.tool().preferences = preferences

----------------------------------------------------
--Notifications
----------------------------------------------------

renoise.tool().app_new_document_observable:add_notifier(function() 
  if preferences.enabled.value then 
    renoise.app().window.disk_browser_is_visible = false
  end
end)

----------------------------------------------------
--Menu Entry
----------------------------------------------------

renoise.tool():add_menu_entry {
  name = "Main Menu:Tools:MinimizeDiskOps:Minimize After Song-load",
  invoke = function()
    preferences.enabled.value = not preferences.enabled.value
  end,
  selected = function()
    return (preferences.enabled.value == true)
  end,
}

----------------------------------------------------
--Keybindings
----------------------------------------------------

renoise.tool():add_keybinding {
  name = "Global:Tools:MinimizeDiskOps Minimize After Song-load",
  invoke = function()
    preferences.enabled.value = not preferences.enabled.value
  end
}

----------------------------------------------------
--DEBUG: Reload script when saved
----------------------------------------------------

_AUTO_RELOAD_DEBUG = function()
  
end


