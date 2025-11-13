extends Node

var MOD_NAME = "Replay+"
onready var VERSION = ModLoader._readMetadata("res://ReplayPlus/_metadata")["version"]

func overwrite_path(new, old):
	var new_scr = load(new)
	if not new_scr is PackedScene:
		new_scr.new()
	new_scr.take_over_path(old)
	pass

func _init(modLoader = ModLoader):
	if "mh" in Global.VERSION.to_lower():
		if ProjectSettings.load_resource_pack("res://ReplayPlus/TimelineMH.zip", true):
			print("ReplayPlus Timeline for Multihustle installed.")

	modLoader.installScriptExtension("res://ReplayPlus/MLMainHook.gd")
	var file = File.new()
	if file.file_exists("res://SoupModOptions/ModOptions.gd"):
		modLoader.installScriptExtension("res://ReplayPlus/ModOptionsAddon.gd")
	name = "ReplayPlus"
