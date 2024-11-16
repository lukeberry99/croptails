extends PanelContainer

@onready var tool_axe: Button = $MarginContainer/HBoxContainer/ToolAxe
@onready var tool_watering: Button = $MarginContainer/HBoxContainer/ToolWatering
@onready var tool_corn: Button = $MarginContainer/HBoxContainer/ToolCorn
@onready var tool_tomato: Button = $MarginContainer/HBoxContainer/ToolTomato
@onready var tool_tilling: Button = $MarginContainer/HBoxContainer/ToolTilling

func _ready() -> void:
	ToolManager.tool_deselected.connect(on_tool_deselected)
	ToolManager.tool_selected_via_input.connect(on_tool_selected_via_input)
	ToolManager.enable_tool.connect(on_enable_tool)
	
	tool_axe.disabled = true
	tool_axe.focus_mode = Control.FOCUS_NONE
	
	tool_watering.disabled = true
	tool_watering.focus_mode = Control.FOCUS_NONE
	
	tool_corn.disabled = true
	tool_corn.focus_mode = Control.FOCUS_NONE	
	
	tool_tomato.disabled = true
	tool_tomato.focus_mode = Control.FOCUS_NONE
	
	tool_tilling.disabled = true
	tool_tilling.focus_mode = Control.FOCUS_NONE

func on_tool_deselected() -> void:
	print('deslecting all tools')
	tool_axe.release_focus()
	tool_watering.release_focus()
	tool_tilling.release_focus()
	tool_corn.release_focus()
	tool_tomato.release_focus()

func on_tool_selected_via_input(tool: DataTypes.Tools) -> void:
	print('Selecting', tool)
	if tool == DataTypes.Tools.AxeWood and tool_axe.disabled == false:
		tool_axe.grab_focus()
	if tool == DataTypes.Tools.WaterCrops and tool_watering.disabled == false:
		tool_watering.grab_focus()
	if tool == DataTypes.Tools.TillGround and tool_tilling.disabled == false:
		tool_tilling.grab_focus()
	if tool == DataTypes.Tools.PlantCorn and tool_corn.disabled == false:
		tool_corn.grab_focus()
	if tool == DataTypes.Tools.PlantTomato and tool_tomato.disabled == false:
		tool_tomato.grab_focus()

func on_enable_tool(tool: DataTypes.Tools) -> void:
	if tool == DataTypes.Tools.TillGround:
		tool_tilling.disabled = false
		tool_tilling.focus_mode = Control.FOCUS_ALL
	elif tool == DataTypes.Tools.AxeWood:
		tool_axe.disabled = false
		tool_axe.focus_mode = Control.FOCUS_ALL
	elif tool == DataTypes.Tools.WaterCrops:
		tool_watering.disabled = false
		tool_watering.focus_mode = Control.FOCUS_ALL
	elif tool == DataTypes.Tools.PlantCorn:
		tool_corn.disabled = false
		tool_corn.focus_mode = Control.FOCUS_ALL
	elif tool == DataTypes.Tools.PlantTomato:
		tool_tomato.disabled = false
		tool_tomato.focus_mode = Control.FOCUS_ALL
